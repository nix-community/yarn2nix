{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    test -f ./node_modules/.yarn-integrity

    # dependencies
    test -f ./node_modules/async/package.json

    # devDependencies
    test -f ./node_modules/chai/package.json
  '';
}
