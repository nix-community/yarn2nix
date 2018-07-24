import ./tests { yarn2nix = import ./default.nix {}; inherit (import <nixpkgs> {}) fetchFromGitHub; }
