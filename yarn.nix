{fetchurl, gnutar, stdenv, symlinkJoin, writeScriptBin, bash, nodePackages, writeTextFile, strace }:
with builtins;
let
  getDep = {name, url, sha1, reference}:(
    let
      tar = fetchurl {
        inherit name url sha1;
      };
      metadata = {
        remote = {
          resolved = url;
          type = "tarball";
          reference = reference;
          hash = sha1;
          registry = "npm";
        };
        registry = "npm";
        hash = sha1;
      };
      json_metadata_file = writeTextFile { 
        name = "yarn-metadata";
        text = toJSON metadata;
      };
    in
    { inherit name;
      dir = stdenv.mkDerivation {
        name = "dep-${name}";
        src = tar;
        phases = "unpackPhase";
        unpackPhase = ''
          ${gnutar}/bin/tar --warning=no-unknown-keyword -xzf $src
          mv package $out
          cp ${json_metadata_file} $out/.yarn-metadata.json
        '';
      };
    });

  yarnDeps = deps: map getDep deps;
  yarnDepsCache = deps:
    stdenv.mkDerivation {
      name = "yarn-cache";
      phases = "linkPhase";
      linkPhase = ''
        mkdir -p $out/.tmp
      '' + concatStringsSep "\n" (map (dep: with dep; "cp -r ${dir} $out/${name}") (yarnDeps deps));
  };
in
rec {
  inherit yarnCmd;

  yarnEnv = package_json: lockFile: deps: 
    let
      deps_dirs = (yarnDepsCache deps);
      ln_node_modules = concatStringsSep "\n" (map (dep: "mkdir $out/node_modules/${dep.name}; cp -r ${dep.dir}/* $out/node_modules/${dep.name}/" ) (yarnDeps deps));
    in
    stdenv.mkDerivation rec {
      name = "yarn-env";
      phases = "installPhase";
      inherit lockFile;

#      cmd_normal= "${nodePackages.yarn}/bin/yarn install --pure-lockfile --offline";
#      cmd_strace= "${strace}/bin/strace -f ${cmd_normal}  2>&1 | grep -v '^futex('";
#      cmd= "${cmd_strace}) || (sleep 1000; exit 1)";
#      cmd = cmd_normal;
      installPhase = ''
        mkdir -p .cache/yarn

        for dir in ${deps_dirs}/*; do
          dep_dir_name=$(basename $dir)
          mkdir .cache/yarn/$dep_dir_name
          cp --no-preserve=all -r $dir/* .cache/yarn/$dep_dir_name/
        done

        mkdir -p $out/node_modules
        ls .cache

        ${ln_node_modules}

        cp ${package_json} ./package.json
        cp ${lockFile} ./yarn.lock
        #HOME=`pwd` ${nodePackages.yarn}/bin/yarn check --modules-folder $out/node_modules
        find $out/node_modules

      '';
    };
}
