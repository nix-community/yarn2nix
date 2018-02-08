self: super: let
  nodejs = super.pkgs.nodejs-8_x;
  nodePackages = import ./node { inherit nodejs; };
in rec {
  inherit nodejs;
  node2nix = (import (import ./node2nix.nix {}) {}).package;
  yarn = (super.yarn.override ({ inherit nodejs; }));
  yarn2nix = (import ./.. { inherit nodejs; }).yarn2nix;
}
