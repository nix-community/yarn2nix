{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nixos-unstable-${version}";
  version = "2018-03-23";

  # nix-prefetch-git git@github.com:NixOS/nixpkgs-channels.git --rev refs/heads/nixpkgs-unstable
  src = fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "13e74a838db27825c88be99b1a21fbee33aa6803";
    sha256 = "02kmj8cvxhhhalx14hbwwrzdnmpp072wgl5drlk6asn0zg68cgmy";
  };

  dontBuild = true;
  preferLocalBuild = true;

  installPhase = ''
    cp -a . $out
  '';
}
