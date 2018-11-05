#!/usr/bin/env bash
set -euo pipefail

: "${NIXPKGS_CHANNEL:=nixpkgs-unstable}"

nix_options=(
  --no-out-link
  --option sandbox true
  --show-trace
  -I "nixpkgs=channel:$NIXPKGS_CHANNEL"
)

echo "--- Running tests with IFD enabled"
nix-build tests "${nix_options[@]}" \
  --option allow-import-from-derivation true

echo "--- Running tests with IFD disabled"
nix-build tests "${nix_options[@]}" \
  --option allow-import-from-derivation false \
  -A no-import-from-derivation
