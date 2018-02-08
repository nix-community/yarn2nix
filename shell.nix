{ nixpkgs ? <nixpkgs>, system ? builtins.currentSystem }:

with import nixpkgs {
  inherit system;
  overlays = [(import ./nix/overlay.nix)];
};

(import ./nix/node { nodejs = pkgs.nodejs; }).shell.override (attrs: {
  buildInputs = with pkgs; [
    yarn flow nodejs node2nix yarn2nix nix-prefetch-scripts
  ];
  shellHook = attrs.shellHook + ''
    export PATH="''${NODE_PATH}/../../bin:''${PATH}"
  '';
})
