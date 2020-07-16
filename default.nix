{ pkgs ? import <nixpkgs> {}
, nodejs ? pkgs.nodejs
, yarn ? pkgs.yarn
, src ? ./.
}:

let
  inherit (pkgs) stdenv lib callPackage git rsync makeWrapper yarn2nix-moretea;
  inherit (yarn2nix-moretea) mkYarnPackage defaultYarnFlags;

in rec {
  yarn2nix = mkYarnPackage {
    src =
      let
        inherit src;

        mkFilter = { dirsToInclude, filesToInclude, root }: path: type:
          let
            inherit (pkgs.lib) any flip elem hasSuffix hasPrefix elemAt splitString;

            subpath = elemAt (splitString "${toString root}/" path) 1;
            spdir = elemAt (splitString "/" subpath) 0;
          in elem spdir dirsToInclude ||
            (type == "regular" && elem subpath filesToInclude);
      in builtins.filterSource
          (mkFilter {
            dirsToInclude = ["bin" "lib"];
            filesToInclude = ["package.json" "yarn.lock"];
            root = src;
          })
          src;

    # yarn2nix is the only package that requires the yarnNix option.
    # All the other projects can auto-generate that file.
    yarnNix = ./yarn.nix;
    
    # Using the filter above and importing package.json from the filtered
    # source results in an error in restricted mode. To circumvent this,
    # we import package.json from the unfiltered source
    packageJSON = ./package.json;

    yarnFlags = defaultYarnFlags ++ ["--production=true"];

    buildPhase = ''
      source ${./nix/expectShFunctions.sh}

      expectFilePresent ./node_modules/.yarn-integrity

      # check dependencies are installed
      expectFilePresent ./node_modules/@yarnpkg/lockfile/package.json

      # check devDependencies are not installed
      expectFileOrDirAbsent ./node_modules/.bin/eslint
      expectFileOrDirAbsent ./node_modules/eslint/package.json
    '';
  };

  fixup_yarn_lock = stdenv.mkDerivation {
    name = "fixup_yarn_lock";

    buildInputs = [ nodejs ];

    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out/lib
      mkdir -p $out/bin

      cp ${./lib/urlToName.js} $out/lib/urlToName.js
      cp ${./internal/fixup_yarn_lock.js} $out/bin/fixup_yarn_lock

      patchShebangs $out
    '';
  };
}
