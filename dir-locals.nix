{ nixpkgs ? <nixpkgs>, system ? builtins.currentSystem }:

with (import nixpkgs { inherit system; }); pkgs.nixBufferBuilders.withPackages
  (import ./shell.nix {
}).buildInputs
