#!/usr/bin/env nix-shell
#! nix-shell -i bash -p ruby
set -e
echo "Generating yarn.nix ..."
ruby ../yarn2nix yarn.lock yarn.nix

echo "Build expression ..."
nix-build test.nix
