{ yarn2nix }:
yarn2nix.mkYarnPackage {
    src = ./.;
    buildPhase = ''
      test -f ./node_modules/@types/minimist/package.json
      test -f ./node_modules/minimist/package.json
    '';
  }