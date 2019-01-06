{ yarn2nix }:

yarn2nix.mkYarnPackage {
  src = ./.;

  yarnFlags = yarn2nix.defaultYarnFlags ++ ["--production=true"];

  buildPhase = ''
    ${import ../../nix/testFileShFunctions.nix}

    testFilePresent ./node_modules/.yarn-integrity

    # check dependencies are installed
    testFilePresent ./node_modules/@types/minimist/package.json

    # check devDependencies are not installed
    testFileOrDirAbsent ./node_modules/minimist/package.json
  '';
}
