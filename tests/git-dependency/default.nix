{ yarn2nix }:
yarn2nix.mkYarnPackage {
  src = ./.;
  buildPhase = ''
    test -f ./node_modules/shell-quote/package.json
    test -f ./node_modules/.yarn-integrity
  '';
}
