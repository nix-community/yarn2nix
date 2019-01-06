{ yarn2nix ? import ../. {} }:

let
  workspace = import ./workspace { inherit yarn2nix; };
in
{
  wetty                   = import ./wetty { inherit yarn2nix; };
  weave-front-end         = import ./weave-front-end { inherit yarn2nix; };
  sendgrid-helpers        = import ./sendgrid-helpers { inherit yarn2nix; };
  duplicate-pkgs          = import ./duplicate-pkgs { inherit yarn2nix; };
  git-dependency          = import ./git-dependency { inherit yarn2nix; };
  only-production         = import ./only-production { inherit yarn2nix; };
  workspace-package-one   = workspace.package-one;
  workspace-package-two   = workspace.package-two;
  workspace-package-three = workspace.package-three;
}
