{ yarn2nix ? import ../. {} }:
with builtins;
let
  inherit (yarn2nix) mkYarnPackage;
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
} // {
  duplicate-pkgs = import ./duplicate-pkgs { inherit yarn2nix; };
  git-dependency = import ./git-dependency { inherit yarn2nix; };
}
