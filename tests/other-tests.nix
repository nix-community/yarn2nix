{ pkgs ? import <nixpkgs> {},
  y2nPkgs ? import ../. {} }:

let
  inherit (y2nPkgs) yarn2nix;
  inherit (pkgs.yarn2nix-moretea) mkYarnPackage mkYarnWorkspace defaultYarnFlags;

  workspace = import ./workspace { inherit mkYarnWorkspace; };
  scoped-workspace = import ./scoped-workspace { inherit mkYarnWorkspace; };
in
{
  wetty                   = import ./wetty { inherit mkYarnPackage; };
  weave-front-end         = import ./weave-front-end { inherit mkYarnPackage; };
  sendgrid-helpers        = import ./sendgrid-helpers { inherit mkYarnPackage; };
  duplicate-pkgs          = import ./duplicate-pkgs { inherit mkYarnPackage; };
  git-dependency          = import ./git-dependency { inherit mkYarnPackage; };
  only-production         = import ./only-production { inherit mkYarnPackage defaultYarnFlags; };

  workspace-package-one   = workspace.package-one;
  workspace-package-two   = workspace.package-two;
  workspace-package-three = workspace.package-three;

  scoped-workspace-package-one   = scoped-workspace.testcompany-one;
  scoped-workspace-package-two   = scoped-workspace.testcompany-two;
  scoped-workspace-package-three = scoped-workspace.testcompany-three;
}
