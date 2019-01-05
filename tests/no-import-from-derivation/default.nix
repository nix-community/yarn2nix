{ mkYarnPackage, fetchFromGitHub }:

mkYarnPackage rec {
  src = fetchFromGitHub {
    owner = "stevemao";
    repo = "left-pad";
    rev = "v1.3.0";
    sha256 = "0mjvb0b51ivwi9sfkiqnjbj2y1rfblydnb0s4wdk46c7lsf1jisg";
  };
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
  yarnNix = ./yarn.nix;
  buildPhase = ''
    test -f ./node_modules/.yarn-integrity

    # test bin
    test -f ./node_modules/.bin/acorn

    # devDependencies
    test -f ./node_modules/benchmark/package.json
  '';
}
