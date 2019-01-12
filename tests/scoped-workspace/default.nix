{ yarn2nix }:

yarn2nix.mkYarnWorkspace {
  src = ./.;

  packageOverrides = {
    testcompany-one = {
      publishBinsFor = [ "@testcompany/one" "gulp" ];

      doInstallCheck = true;
      installCheckPhase = ''
        ${import ../../nix/expectShFunctions.nix}

        output=$($out/bin/testcompany-one)
        expected_output="HELLO FROM @TESTCOMPANY/TWO!"
        expectEqual "$output" "$expected_output"

        $out/bin/gulp --help
      '';
    };
  };
}
