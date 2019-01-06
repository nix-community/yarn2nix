{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    ${import ../../nix/testFileShFunctions.nix}

    testFilePresent ./node_modules/.yarn-integrity

    # dependencies
    testFilePresent ./node_modules/express/package.json

    # devDependencies
    testFilePresent ./node_modules/load-grunt-tasks/package.json
  '';
}
