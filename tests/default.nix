{ lib, yarn2nix }:
with builtins;
let
  build = names: map buildEntry names;
  buildEntry = name: {
    inherit name;
    value = yarn2nix.mkYarnPackage {
      # This `toPath` call looks redundant, but it's necessary in order to
      # resolve relative paths in file:// dependencies correctly.
      src = builtins.toPath (./. + "/${name}");
    };
  };
in
listToAttrs (build (attrNames
  (lib.filterAttrs (name: value: value == "directory")
    (readDir ./.))))
