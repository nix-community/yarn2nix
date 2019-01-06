{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    ${import ../../nix/testFileShFunctions.nix}

    testFilePresent ./node_modules/.yarn-integrity

    # check dependencies are present
    testFilePresent ./node_modules/@types/minimist/package.json
    testFilePresent ./node_modules/minimist/package.json
  '';
}
