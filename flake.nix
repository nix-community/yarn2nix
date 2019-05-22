{
  name = "yarn2nix";
  description = "Converts `yarn.lock` files into nix expressions";
  epoch = 2019;
  requires = [ "nixpkgs" ];

  provides = flakes:
    let
      pkgs = import ./. { pkgs = flakes.nixpkgs.provides.legacyPkgs; };
    in
      {
        packages = pkgs;
        defaultPackage = pkgs.yarn2nix;
      };
}
