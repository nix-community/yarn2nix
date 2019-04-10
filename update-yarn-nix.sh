#!/usr/bin/env bash

set -euo pipefail

THIS_SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
PROJECT_ROOT=$THIS_SCRIPT_DIR
cd $THIS_SCRIPT_DIR
yarn install
node $PROJECT_ROOT/bin/yarn2nix.js > $THIS_SCRIPT_DIR/yarn.nix
