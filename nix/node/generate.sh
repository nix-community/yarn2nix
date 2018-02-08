#!/bin/sh -e

rm -f default.nix node-packages.nix node-env.nix
"$(nix-build "$(dirname "$0")/../node2nix.nix" --no-out-link)/bin/node2nix" \
  --production \
  --nodejs-8 \
  --input "$(dirname "$0")/package.json" \
  --composition "$(dirname "$0")/default.nix" \
  --node-env "$(dirname "$0")/node-env.nix"
