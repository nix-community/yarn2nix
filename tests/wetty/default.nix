{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    test -f ./node_modules/.yarn-integrity

    # dependencies
    test -f ./node_modules/express/package.json

    # devDependencies
    test -f ./node_modules/load-grunt-tasks/package.json
  '';
}
