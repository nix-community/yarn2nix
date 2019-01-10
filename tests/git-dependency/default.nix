{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    ${import ../../nix/expectShFunctions.nix}

    expectFilePresent ./node_modules/.yarn-integrity

    # dependencies
    expectFilePresent ./node_modules/shell-quote/package.json
  '';
}
