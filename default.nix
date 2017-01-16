{ pkgs ? (import <nixpkgs> {})}:
with pkgs;

rec {
  yarn = stdenv.mkDerivation rec {
    version = "0.18.1";
    name = "yarn-${version}";
    buildInputs = [nodejs-6_x];
    src = fetchurl {
      name = "yarn";
      url = "https://github.com/yarnpkg/yarn/releases/download/v${version}/yarn-${version}.js";
      sha256 = "0rpzbg0kp7sz50dnyphw6dzl0v01j2p08cnx1wa9nzz7jky0mdzn";
    };

    phases = "installPhase fixupPhase";
    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/yarn
      chmod +x $out/bin/yarn
    '';
  };

  buildYarnPackageDeps = { name, packageJson, yarnLock, offline_cache }:
    stdenv.mkDerivation {
      name = "${name}-modules";

      phases = "buildPhase";
      buildInputs = [ yarn nodejs-6_x ];

      buildPhase = ''
        # Yarn writes cache directories etc to $HOME.
        export HOME=`pwd`/yarn_home

        cp ${packageJson} ./package.json
        cp ${yarnLock} ./yarn.lock

        ln -s ${offline_cache}/ npm-packages-offline-cache
        yarn config set yarn-offline-mirror `pwd`/npm-packages-offline-cache --offline

        # Do not look up in the registry, but in the offline cache.
        # TODO: Ask upstream to fix this mess.
        sed -i 's/https:\/\/registry.yarnpkg.com\/.*\/-\///' yarn.lock
        yarn --offline

        mkdir $out
        mv node_modules $out/
      '';
    };

  buildYarnPackage = {name, src, packageJson, yarnLock, extraBuildInputs ? [], offline_cache, ... }@args:
    let
      deps = buildYarnPackageDeps {
        inherit name offline_cache;
        inherit packageJson;
        inherit yarnLock;
      };
      npmPackageName = if lib.hasAttr "npmPackageName" args
        then args.npmPackageName
        else (builtins.fromJSON (builtins.readFile "${src}/package.json")).name ;
      publishBinsFor = if lib.hasAttr "publishBinsFor" args
        then args.publishBinsFor
        else [npmPackageName];
    in stdenv.mkDerivation rec {
      inherit name;
      inherit src;

      buildInputs = [ yarn nodejs-6_x ] ++ extraBuildInputs;

      phases = "unpackPhase yarnPhase fixupPhase";

      yarnPhase = ''
        if [ -d node-modules ]; then
          echo "Node modules dir present. Removing."
          rm -rf node-modules
        fi

        if [ -d npm-packages-offline-cache ]; then
          echo "npm-pacakges-offline-cache dir present. Removing."
          rm -rf npm-packages-offline-cache
        fi

        mkdir -p $out/node_modules
        ln -s ${deps}/node_modules/* $out/node_modules/

        if [ -d $out/node-modules/${npmPackageName} ]; then
          echo "Error! There is already an ${npmPackageName} package in the top level node_modules dir!"
          exit 1
        fi

        mkdir $out/node_modules/${npmPackageName}/
        cp -r * $out/node_modules/${npmPackageName}/
      '';

      preFixup = ''
        mkdir $out/bin
        node ${./nix/fixup_bin.js} $out ${lib.concatStringsSep " " publishBinsFor}
      '';
  };

  yarn2nix = buildYarnPackage {
    name = "yarn2nix";
    src = ./.;
    packageJson = ./package.json;
    yarnLock = ./yarn.lock;
    offline_cache = (callPackage ./package.nix {}).offline_cache;
  };
}
