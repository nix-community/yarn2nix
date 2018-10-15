#!/usr/bin/env bash
set -euo pipefail

: "${NIXPKGS_CHANNEL:=nixpkgs-unstable}"

nix_options=(
  --no-out-link
  #--option allow-import-from-derivation false
  #--option restrict-eval true
  --option sandbox true
  --show-trace
  -I "nixpkgs=channel:$NIXPKGS_CHANNEL"
)

nix-build tests "${nix_options[@]}"

nix-build tests "${nix_options[@]}" \
  --option allow-import-from-derivation false \
  -A no-import-from-derivation
