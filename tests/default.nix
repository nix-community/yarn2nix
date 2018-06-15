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
  workspace = rec {
    package-one = yarn2nix.mkYarnPackage {
      src = ./workspace/package-one;
      yarnLock = ./workspace/yarn.lock;
      workspaceDependencies = { inherit package-two; };
    };
    package-two = yarn2nix.mkYarnPackage {
      src = ./workspace/package-two;
      yarnLock = ./workspace/yarn.lock;
    };
  }.package-one;
}
