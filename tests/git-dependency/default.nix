{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    ${import ../../nix/testFileShFunctions.nix}

    testFilePresent ./node_modules/.yarn-integrity

    # dependencies
    testFilePresent ./node_modules/shell-quote/package.json
  '';
}
