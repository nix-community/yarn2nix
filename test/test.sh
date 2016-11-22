ruby ../yarn2nix yarn.lock yarn.nix
nix-build -E 'with import (builtins.fetchTarball https://github.com/moretea/nixpkgs/archive/baea57c378d10e1336ed72472e9ee0073c8147b5.tar.gz) {};
  (pkgs.callPackage ../yarn.nix {}).yarnEnv ./package.json ./yarn.lock (import ./yarn.nix)'
