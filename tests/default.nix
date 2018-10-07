{ yarn2nix }:
with builtins;
let
  build = names: map buildEntry names;
  buildEntry = name: {
    inherit name;
    value = yarn2nix.mkYarnPackage { src = ./. + "/${name}"; };
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
}
