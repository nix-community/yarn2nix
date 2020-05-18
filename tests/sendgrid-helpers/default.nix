{ mkYarnPackage }:

mkYarnPackage {
  src = ./.;
  buildPhase = ''
    source ${../../nix/expectShFunctions.sh}

    expectFilePresent ./node_modules/.yarn-integrity

    # dependencies
    expectFilePresent ./node_modules/chalk/package.json
  '';
}
