{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    ${import ../../nix/testFileShFunctions.nix}

    testFilePresent ./node_modules/.yarn-integrity

    # dependencies
    testFilePresent ./node_modules/async/package.json

    # devDependencies
    testFilePresent ./node_modules/chai/package.json
  '';
}
