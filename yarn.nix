{fetchurl, gnutar, stdenv, symlinkJoin, writeScriptBin, bash, nodePackages }:
with builtins;
let
  getDep = {name, url, sha1}:(
    let
      tar = fetchurl {
        inherit name url sha1;
      };
    in
    { inherit name;
      dir = stdenv.mkDerivation {
        name = "dep-${name}";
        src = tar;
        phases = "unpackPhase";
        unpackPhase = ''
          mkdir -p $out/${name}
          ${gnutar}/bin/tar -C $out/${name} -xzf $src
        '';
      };
    });

  yarnDeps = deps:
    stdenv.mkDerivation {
      name = "yarn-dependencies";
      phases = "linkPhase";
      linkPhase = ''
        mkdir $out
      '' + concatStringsSep "\n" (map (dep: with (getDep dep); "ln ${dir} -s $out/${name}") deps);
  };

  yarnCmd = deps: cmd: args:
    writeScriptBin "yarn-run" ''
      #!${bash}/bin/bash
      ${nodePackages.yarn}/bin/yarn ${cmd} --global-folder ${yarnDeps deps} ${args}
    '';
in
rec {
  inherit yarnCmd;

  yarnEnv = package_json: lockfile: deps: 
    stdenv.mkDerivation {
      name = "yarn-env";
      phases = "installPhase";
      installPhase = ''
        mkdir -p .cache/yarn
        for dir in ${yarnDeps deps}/*; do
          ln -s $dir .cache/yarn/`basename $dir`
        done
        cp ${package_json} ./package.json
        cp ${lockfile} ./yarn.lock
        mkdir $out
        ############################### Yarn doesn't like the current information yet.
        HOME=$pwd ${nodePackages.yarn}/bin/yarn install --offline
      '';
    };
}
