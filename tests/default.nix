{ yarn2nix ? import ../. {} }:
with builtins;
let
  inherit (yarn2nix) mkYarnPackage;
  inherit (yarn2nix.pkgs) fetchFromGitHub;
  build = names: map buildEntry names;
  buildEntry = name: {
    inherit name;
    value = mkYarnPackage { src = ./. + "/${name}"; };
  };
in
(listToAttrs (build ["wetty" "weave-front-end" "sendgrid-helpers"])) // {
  workspace = (yarn2nix.mkYarnWorkspace {
    src = ./workspace;
    packageOverrides.package-one = {
      publishBinsFor = [ "package-one" "gulp" ];
      doInstallCheck = true;
      installCheckPhase = ''
        $out/bin/package-one
        $out/bin/gulp --help
      '';
    };
  }).package-one;
  inherit (yarn2nix.mkYarnWorkspace {
    src = fetchFromGitHub {
      owner = "facebook";
      repo = "nuclide";
      rev = "v0.366.0";
      sha256 = "1iyy8by8p90dncyqi3pgaj36hmz1khi9w1rkhd5gi9nbkkv5can4";
    };
  }) nuclide-node-transpiler;
} // {
  duplicate-pkgs = import ./duplicate-pkgs { inherit yarn2nix; };
  no-import-from-derivation = import ./no-import-from-derivation {
    inherit mkYarnPackage fetchFromGitHub;
  };
}
