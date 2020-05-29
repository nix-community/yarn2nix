{ pkgs ? import <nixpkgs> {},
  y2nPkgs ? import ../. {} }:

let
  inherit (y2nPkgs) yarn2nix;
  inherit (pkgs.yarn2nix-moretea) mkYarnPackage;
  inherit (pkgs) fetchFromGitHub;

in {
  no-import-from-derivation = import ./no-import-from-derivation {
    inherit mkYarnPackage fetchFromGitHub;
  };
}
