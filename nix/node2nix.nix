{ nixpkgs ? <nixpkgs>, system ? builtins.currentSystem }:

with (import nixpkgs { inherit system; });

# nix-prefetch-git git@github.com:svanderburg/node2nix.git --rev refs/heads/master
fetchFromGitHub {
  owner = "svanderburg";
  repo = "node2nix";
  rev = "2bae2049ba7d7f0b5b7c862bfd3bfeb5855b53cb";
  sha256 = "10pmn3fa6rmpqqr7z5si7zpvjfqrcwrrx666f0bld6w8m4fszmbg";
}
