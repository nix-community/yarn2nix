{ pkgs ? import <nixpkgs> {}
, nodejs ? pkgs.nodejs
, yarn ? pkgs.yarn
}:

let
  inherit (pkgs) stdenv lib fetchurl linkFarm;
in rec {
  # Export yarn again to make it easier to find out which yarn was used.
  inherit yarn;

  unlessNull = item: alt:
    if item == null then alt else item;

  reformatPackageName = pname:
    let
      # regex adapted from `validate-npm-package-name`
      # will produce 3 parts e.g.
      # "@someorg/somepackage" -> [ "@someorg/" "someorg" "somepackage" ]
      # "somepackage" -> [ null null "somepackage" ]
      parts = builtins.tail (builtins.match "^(@([^/]+)/)?([^/]+)$" pname);
      # if there is no organisation we need to filter out null values.
      non-null = builtins.filter (x: x != null) parts;
    in builtins.concatStringsSep "-" non-null;

  uniqueByPackageName = list:
    if list == [] then
      []
    else
      let
        x = lib.head list;
        xs = uniqueByPackageName (lib.drop 1 list);
      in [x] ++ lib.filter (e: x.package.name != e.package.name) xs;

  # Generates the yarn.nix from the yarn.lock file
  mkYarnNix = yarnLock:
    pkgs.runCommand "yarn.nix" {}
      "${yarn2nix}/bin/yarn2nix --lockfile ${yarnLock} --no-patch > $out";

  # Loads the generated offline cache. This will be used by yarn as
  # the package source.
  importOfflineCache = yarnNix:
    let
      pkg = import yarnNix { inherit fetchurl linkFarm; };
    in
      pkg.offline_cache;

  defaultYarnFlags = [
    "--offline"
    "--frozen-lockfile"
    "--ignore-engines"
    "--ignore-scripts"
  ];

  mkYarnModules = {
    name,
    pname,
    version,
    packageJSON,
    yarnLock,
    yarnNix ? mkYarnNix yarnLock,
    yarnFlags ? defaultYarnFlags,
    pkgConfig ? {},
    preBuild ? "",
    workspaceDependencies ? [],
  }:
    let
      offlineCache = importOfflineCache yarnNix;
      extraBuildInputs = (lib.flatten (builtins.map (key:
        pkgConfig.${key} . buildInputs or []
      ) (builtins.attrNames pkgConfig)));
      postInstall = (builtins.map (key:
        if (pkgConfig.${key} ? postInstall) then
          ''
            for f in $(find -L -path '*/node_modules/${key}' -type d); do
              (cd "$f" && (${pkgConfig.${key}.postInstall}))
            done
          ''
        else
          ""
      ) (builtins.attrNames pkgConfig));
      workspaceJSON = pkgs.writeText "${name}-workspace-package.json" (builtins.toJSON {
        private = true;
        workspaces = [pname] ++ builtins.map (x: "deps/${x.pname}") workspaceDependencies;
      });
      workspaceDependencyLinks = lib.concatStringsSep "\n" (builtins.map (dep:
        ''
          mkdir -p deps/${dep.pname}
          ln -s ${dep.packageJSON} deps/${dep.pname}/package.json
        '') workspaceDependencies);
      workspaceDependencyRemoves =
        "rm -f ${lib.concatMapStringsSep
          " "
          (x: "node_modules/${x}")
          ([pname] ++ (builtins.map (x: x.pname) workspaceDependencies))}";
in
    stdenv.mkDerivation {
      inherit preBuild name;
      phases = ["configurePhase" "buildPhase"];
      buildInputs = [ yarn nodejs ] ++ extraBuildInputs;

      configurePhase = ''
        # Yarn writes cache directories etc to $HOME.
        export HOME=$PWD/yarn_home
      '';

      buildPhase = ''
        runHook preBuild

        mkdir -p ${pname}
        cp ${packageJSON} ./${pname}/package.json
        cp ${workspaceJSON} ./package.json
        cp ${yarnLock} ./yarn.lock
        chmod +w ./yarn.lock

        yarn config --offline set yarn-offline-mirror ${offlineCache}

        # Do not look up in the registry, but in the offline cache.
        # TODO: Ask upstream to fix this mess.
        sed -i -E 's|^(\s*resolved\s*")https?://.*/|\1|' yarn.lock

        ${workspaceDependencyLinks}
        yarn install ${lib.escapeShellArgs yarnFlags}
        ${workspaceDependencyRemoves}

        ${lib.concatStringsSep "\n" postInstall}

        mkdir $out
        mv node_modules $out/
        patchShebangs $out
      '';
    };

  # This can be used as a shellHook in mkYarnPackage. It brings the built node_modules into
  # the shell-hook environment.
  linkNodeModulesHook = ''
    if [[ -d node_modules || -L node_modules ]]; then
      echo "./node_modules is present. Replacing."
      rm -rf node_modules
    fi

    ln -s "$node_modules" node_modules
  '';

  mkYarnWorkspace = {
    src,
    packageJSON ? src+"/package.json",
    yarnLock ? src+"/yarn.lock",
    packageOverrides ? {},
    ...
  }@attrs:
  let
    package = lib.importJSON packageJSON;
    packageGlobs = package.workspaces;
    globElemToRegex = lib.replaceStrings ["*"] [".*"];
    # PathGlob -> [PathGlobElem]
    splitGlob = lib.splitString "/";
    # Path -> [PathGlobElem] -> [Path]
    # Note: Only directories are included, everything else is filtered out
    expandGlobList = base: globElems:
    let
      elemRegex = globElemToRegex (lib.head globElems);
      rest = lib.tail globElems;
      children = lib.attrNames (lib.filterAttrs (name: type: type == "directory") (builtins.readDir base));
      matchingChildren = lib.filter (child: builtins.match elemRegex child != null) children;
    in if globElems == []
      then [ base ]
      else lib.concatMap (child: expandGlobList (base+("/"+child)) rest) matchingChildren;
    # Path -> PathGlob -> [Path]
    expandGlob = base: glob: expandGlobList base (splitGlob glob);
    packagePaths = lib.concatMap (expandGlob src) packageGlobs;
    packages = lib.listToAttrs (map (src:
    let
      packageJSON = src+"/package.json";
      package = lib.importJSON packageJSON;
      allDependencies = lib.foldl (a: b: a // b) {} (map (field: lib.attrByPath [field] {} package) ["dependencies" "devDependencies"]);
    in rec {
      name = reformatPackageName package.name;
      value = mkYarnPackage (builtins.removeAttrs attrs ["packageOverrides"] // {
        inherit src packageJSON yarnLock;
        workspaceDependencies = lib.mapAttrsToList (name: version: packages.${name})
          (lib.filterAttrs (name: version: packages ? ${name}) allDependencies);
      } // lib.attrByPath [name] {} packageOverrides);
    }) packagePaths);
  in packages;

  mkYarnPackage = {
    name ? null,
    src,
    packageJSON ? src + "/package.json",
    yarnLock ? src + "/yarn.lock",
    yarnNix ? mkYarnNix yarnLock,
    yarnFlags ? defaultYarnFlags,
    yarnPreBuild ? "",
    pkgConfig ? {},
    extraBuildInputs ? [],
    publishBinsFor ? null,
    workspaceDependencies ? [],
    ...
  }@attrs:
    let
      package = lib.importJSON packageJSON;
      pname = package.name;
      safeName = reformatPackageName pname;
      version = package.version;
      deps = mkYarnModules {
        name = "${safeName}-modules-${version}";
        preBuild = yarnPreBuild;
        workspaceDependencies = workspaceDependenciesTransitive;
        inherit packageJSON pname version yarnLock yarnNix yarnFlags pkgConfig;
      };
      publishBinsFor_ = unlessNull publishBinsFor [pname];
      workspaceDependenciesTransitive = uniqueByPackageName
        (lib.flatten (builtins.map (dep: dep.workspaceDependencies) workspaceDependencies)) ++ workspaceDependencies;
      workspaceDependencyCopy =
        lib.concatStringsSep
          "\n"
          (builtins.map
            (dep: "cp -r --no-preserve=all ${dep.src} node_modules/${dep.pname}")
            workspaceDependenciesTransitive);
    in stdenv.mkDerivation (builtins.removeAttrs attrs ["pkgConfig" "workspaceDependencies"] // {
      inherit src;

      name = unlessNull name "${safeName}-${version}";

      buildInputs = [ yarn nodejs ] ++ extraBuildInputs;

      node_modules = deps + "/node_modules";

      configurePhase = attrs.configurePhase or ''
        runHook preConfigure

        if [ -d npm-packages-offline-cache ]; then
          echo "npm-pacakges-offline-cache dir present. Removing."
          rm -rf npm-packages-offline-cache
        fi

        if [[ -d node_modules || -L node_modules ]]; then
          echo "./node_modules is present. Removing."
          rm -rf node_modules
        fi

        mkdir -p node_modules
        # ln gets confused when the glob doesn't match anything
        if [ "$(ls $node_modules | wc -l)" -gt 0 ]; then
          ln -s $node_modules/* node_modules/
          ln -s $node_modules/.bin node_modules/
        fi

        ${workspaceDependencyCopy}

        if [ -d node_modules/${pname} ]; then
          echo "Error! There is already an ${pname} package in the top level node_modules dir!"
          exit 1
        fi

        runHook postConfigure
      '';

      # Replace this phase on frontend packages where only the generated
      # files are an interesting output.
      installPhase = attrs.installPhase or ''
        runHook preInstall

        mkdir -p $out
        cp -r node_modules $out/node_modules
        cp -r . $out/node_modules/${pname}
        rm -rf $out/node_modules/${pname}/node_modules

        mkdir $out/bin
        node ${./nix/fixup_bin.js} $out ${lib.concatStringsSep " " publishBinsFor_}

        runHook postInstall
      '';

      passthru = {
        inherit pname package packageJSON deps;
        workspaceDependencies = workspaceDependenciesTransitive;
      } // (attrs.passthru or {});

      # TODO: populate meta automatically
    });

  yarn2nix = mkYarnPackage {
    src = ./.;
    # yarn2nix is the only package that requires the yarnNix option.
    # All the other projects can auto-generate that file.
    yarnNix = ./yarn.nix;
  };
}
