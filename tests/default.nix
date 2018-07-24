{ yarn2nix, fetchFromGitHub }:
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
  }).package-one;
  jest = (yarn2nix.mkYarnWorkspace {
    src = fetchFromGitHub {
      owner = "facebook";
      repo = "jest";
      rev = "v23.4.1";
      sha256 = "1by94r3mys7jx5ijyk46cz7zxq1al9in78mir612g1qajjfbvmdz";
    };
    packageOverrides = {
      jest = {
        doInstallCheck = false; # TODO: support root workspace build scripts
        installCheckPhase = "$out/bin/jest --help";
      };
    };
  }).jest;
}
