{ yarn2nix }:

yarn2nix.mkYarnWorkspace {
  src = ./.;

  packageOverrides = {
    package-one = {
      publishBinsFor = [ "package-one" "gulp" ];
      doInstallCheck = true;

      installCheckPhase = ''
        $out/bin/package-one
        $out/bin/gulp --help
      '';
    };
  };
}
