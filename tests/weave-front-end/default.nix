{ mkYarnPackage }:

mkYarnPackage {
  src = ./.;
  buildPhase = ''
    source ${../../nix/expectShFunctions.sh}

    expectFilePresent ./node_modules/.yarn-integrity

    # dependencies
    expectFilePresent ./node_modules/async/package.json

    # devDependencies
    expectFilePresent ./node_modules/chai/package.json
  '';
}
