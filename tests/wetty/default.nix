{ yarn2nix }:
yarn2nix.mkYarnPackage {
  src = ./.;
}
