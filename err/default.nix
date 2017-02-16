with (import <nixpkgs> {});
with (import ../. { inherit pkgs; });
buildYarnPackage {
  name = "foobar";
  src = ./.;
  packageJson = ./package.json;
  yarnLock = ./yarn.lock;
}
