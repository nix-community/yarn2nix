{ yarn2nix ? import ../. {} }:
with builtins;
let
  inherit (yarn2nix) mkYarnPackage;
  inherit (yarn2nix.pkgs) fetchFromGitHub;
in
{
  no-import-from-derivation = import ./no-import-from-derivation {
    inherit mkYarnPackage fetchFromGitHub;
  };
}
