{fetchurl, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [

    {
      name = "abbrev-1.0.9.tgz";
      path = fetchurl {
        name = "abbrev-1.0.9.tgz";
        url  = "https://registry.yarnpkg.com/abbrev/-/abbrev-1.0.9.tgz";
        sha1 = "91b4792588a7738c25f35dd6f63752a2f8776135";
      };
    }

    {
      name = "ansi-escapes-1.4.0.tgz";
      path = fetchurl {
        name = "ansi-escapes-1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-1.4.0.tgz";
        sha1 = "d3a8a83b319aa67793662b13e761c7911422306e";
      };
    }

    {
      name = "ansi-regex-2.1.1.tgz";
      path = fetchurl {
        name = "ansi-regex-2.1.1.tgz";
        url  = "https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz";
        sha1 = "c3b33ab5ee360d86e0e628f0468ae7ef27d654df";
      };
    }

    {
      name = "ansi-styles-2.2.1.tgz";
      path = fetchurl {
        name = "ansi-styles-2.2.1.tgz";
        url  = "https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-2.2.1.tgz";
        sha1 = "b432dd3358b634cf75e1e4664368240533c1ddbe";
      };
    }

    {
      name = "aproba-1.0.4.tgz";
      path = fetchurl {
        name = "aproba-1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/aproba/-/aproba-1.0.4.tgz";
        sha1 = "2713680775e7614c8ba186c065d4e2e52d1072c0";
      };
    }

    {
      name = "are-we-there-yet-1.1.2.tgz";
      path = fetchurl {
        name = "are-we-there-yet-1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.2.tgz";
        sha1 = "80e470e95a084794fe1899262c5667c6e88de1b3";
      };
    }

    {
      name = "array-find-index-1.0.2.tgz";
      path = fetchurl {
        name = "array-find-index-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/array-find-index/-/array-find-index-1.0.2.tgz";
        sha1 = "df010aa1287e164bbda6f9723b0a96a1ec4187a1";
      };
    }

    {
      name = "asn1-0.2.3.tgz";
      path = fetchurl {
        name = "asn1-0.2.3.tgz";
        url  = "https://registry.yarnpkg.com/asn1/-/asn1-0.2.3.tgz";
        sha1 = "dac8787713c9966849fc8180777ebe9c1ddf3b86";
      };
    }

    {
      name = "assert-plus-0.2.0.tgz";
      path = fetchurl {
        name = "assert-plus-0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/assert-plus/-/assert-plus-0.2.0.tgz";
        sha1 = "d74e1b87e7affc0db8aadb7021f3fe48101ab234";
      };
    }

    {
      name = "assert-plus-1.0.0.tgz";
      path = fetchurl {
        name = "assert-plus-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz";
        sha1 = "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525";
      };
    }

    {
      name = "asynckit-0.4.0.tgz";
      path = fetchurl {
        name = "asynckit-0.4.0.tgz";
        url  = "https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    }

    {
      name = "aws-sign2-0.6.0.tgz";
      path = fetchurl {
        name = "aws-sign2-0.6.0.tgz";
        url  = "https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.6.0.tgz";
        sha1 = "14342dd38dbcc94d0e5b87d763cd63612c0e794f";
      };
    }

    {
      name = "aws4-1.5.0.tgz";
      path = fetchurl {
        name = "aws4-1.5.0.tgz";
        url  = "https://registry.yarnpkg.com/aws4/-/aws4-1.5.0.tgz";
        sha1 = "0a29ffb79c31c9e712eeb087e8e7a64b4a56d755";
      };
    }

    {
      name = "babel-runtime-6.20.0.tgz";
      path = fetchurl {
        name = "babel-runtime-6.20.0.tgz";
        url  = "https://registry.yarnpkg.com/babel-runtime/-/babel-runtime-6.20.0.tgz";
        sha1 = "87300bdcf4cd770f09bf0048c64204e17806d16f";
      };
    }

    {
      name = "balanced-match-0.4.2.tgz";
      path = fetchurl {
        name = "balanced-match-0.4.2.tgz";
        url  = "https://registry.yarnpkg.com/balanced-match/-/balanced-match-0.4.2.tgz";
        sha1 = "cb3f3e3c732dc0f01ee70b403f302e61d7709838";
      };
    }

    {
      name = "bcrypt-pbkdf-1.0.0.tgz";
      path = fetchurl {
        name = "bcrypt-pbkdf-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.0.tgz";
        sha1 = "3ca76b85241c7170bf7d9703e7b9aa74630040d4";
      };
    }

    {
      name = "bl-1.2.0.tgz";
      path = fetchurl {
        name = "bl-1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/bl/-/bl-1.2.0.tgz";
        sha1 = "1397e7ec42c5f5dc387470c500e34a9f6be9ea98";
      };
    }

    {
      name = "block-stream-0.0.9.tgz";
      path = fetchurl {
        name = "block-stream-0.0.9.tgz";
        url  = "https://registry.yarnpkg.com/block-stream/-/block-stream-0.0.9.tgz";
        sha1 = "13ebfe778a03205cfe03751481ebb4b3300c126a";
      };
    }

    {
      name = "boom-2.10.1.tgz";
      path = fetchurl {
        name = "boom-2.10.1.tgz";
        url  = "https://registry.yarnpkg.com/boom/-/boom-2.10.1.tgz";
        sha1 = "39c8918ceff5799f83f9492a848f625add0c766f";
      };
    }

    {
      name = "brace-expansion-1.1.6.tgz";
      path = fetchurl {
        name = "brace-expansion-1.1.6.tgz";
        url  = "https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.6.tgz";
        sha1 = "7197d7eaa9b87e648390ea61fc66c84427420df9";
      };
    }

    {
      name = "buffer-shims-1.0.0.tgz";
      path = fetchurl {
        name = "buffer-shims-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/buffer-shims/-/buffer-shims-1.0.0.tgz";
        sha1 = "9978ce317388c649ad8793028c3477ef044a8b51";
      };
    }

    {
      name = "builtin-modules-1.1.1.tgz";
      path = fetchurl {
        name = "builtin-modules-1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-1.1.1.tgz";
        sha1 = "270f076c5a72c02f5b65a47df94c5fe3a278892f";
      };
    }

    {
      name = "bytes-2.4.0.tgz";
      path = fetchurl {
        name = "bytes-2.4.0.tgz";
        url  = "https://registry.yarnpkg.com/bytes/-/bytes-2.4.0.tgz";
        sha1 = "7d97196f9d5baf7f6935e25985549edd2a6c2339";
      };
    }

    {
      name = "camelcase-3.0.0.tgz";
      path = fetchurl {
        name = "camelcase-3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/camelcase/-/camelcase-3.0.0.tgz";
        sha1 = "32fc4b9fcdaf845fcdf7e73bb97cac2261f0ab0a";
      };
    }

    {
      name = "caseless-0.11.0.tgz";
      path = fetchurl {
        name = "caseless-0.11.0.tgz";
        url  = "https://registry.yarnpkg.com/caseless/-/caseless-0.11.0.tgz";
        sha1 = "715b96ea9841593cc33067923f5ec60ebda4f7d7";
      };
    }

    {
      name = "chalk-1.1.3.tgz";
      path = fetchurl {
        name = "chalk-1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/chalk/-/chalk-1.1.3.tgz";
        sha1 = "a8115c55e4a702fe4d150abd3872822a7e09fc98";
      };
    }

    {
      name = "ci-info-1.0.0.tgz";
      path = fetchurl {
        name = "ci-info-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/ci-info/-/ci-info-1.0.0.tgz";
        sha1 = "dc5285f2b4e251821683681c381c3388f46ec534";
      };
    }

    {
      name = "cli-cursor-1.0.2.tgz";
      path = fetchurl {
        name = "cli-cursor-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-1.0.2.tgz";
        sha1 = "64da3f7d56a54412e59794bd62dc35295e8f2987";
      };
    }

    {
      name = "cli-width-2.1.0.tgz";
      path = fetchurl {
        name = "cli-width-2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/cli-width/-/cli-width-2.1.0.tgz";
        sha1 = "b234ca209b29ef66fc518d9b98d5847b00edf00a";
      };
    }

    {
      name = "clone-1.0.2.tgz";
      path = fetchurl {
        name = "clone-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/clone/-/clone-1.0.2.tgz";
        sha1 = "260b7a99ebb1edfe247538175f783243cb19d149";
      };
    }

    {
      name = "cmd-shim-2.0.2.tgz";
      path = fetchurl {
        name = "cmd-shim-2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/cmd-shim/-/cmd-shim-2.0.2.tgz";
        sha1 = "6fcbda99483a8fd15d7d30a196ca69d688a2efdb";
      };
    }

    {
      name = "code-point-at-1.1.0.tgz";
      path = fetchurl {
        name = "code-point-at-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz";
        sha1 = "0d070b4d043a5bea33a2f1a40e2edb3d9a4ccf77";
      };
    }

    {
      name = "combined-stream-1.0.5.tgz";
      path = fetchurl {
        name = "combined-stream-1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.5.tgz";
        sha1 = "938370a57b4a51dea2c77c15d5c5fdf895164009";
      };
    }

    {
      name = "commander-2.9.0.tgz";
      path = fetchurl {
        name = "commander-2.9.0.tgz";
        url  = "https://registry.yarnpkg.com/commander/-/commander-2.9.0.tgz";
        sha1 = "9c99094176e12240cb22d6c5146098400fe0f7d4";
      };
    }

    {
      name = "concat-map-0.0.1.tgz";
      path = fetchurl {
        name = "concat-map-0.0.1.tgz";
        url  = "https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    }

    {
      name = "concat-stream-1.6.0.tgz";
      path = fetchurl {
        name = "concat-stream-1.6.0.tgz";
        url  = "https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.0.tgz";
        sha1 = "0aac662fd52be78964d5532f694784e70110acf7";
      };
    }

    {
      name = "console-control-strings-1.1.0.tgz";
      path = fetchurl {
        name = "console-control-strings-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz";
        sha1 = "3d7cf4464db6446ea644bf4b39507f9851008e8e";
      };
    }

    {
      name = "core-js-2.4.1.tgz";
      path = fetchurl {
        name = "core-js-2.4.1.tgz";
        url  = "https://registry.yarnpkg.com/core-js/-/core-js-2.4.1.tgz";
        sha1 = "4de911e667b0eae9124e34254b53aea6fc618d3e";
      };
    }

    {
      name = "core-util-is-1.0.2.tgz";
      path = fetchurl {
        name = "core-util-is-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    }

    {
      name = "cryptiles-2.0.5.tgz";
      path = fetchurl {
        name = "cryptiles-2.0.5.tgz";
        url  = "https://registry.yarnpkg.com/cryptiles/-/cryptiles-2.0.5.tgz";
        sha1 = "3bdfecdc608147c1c67202fa291e7dca59eaa3b8";
      };
    }

    {
      name = "currently-unhandled-0.4.1.tgz";
      path = fetchurl {
        name = "currently-unhandled-0.4.1.tgz";
        url  = "https://registry.yarnpkg.com/currently-unhandled/-/currently-unhandled-0.4.1.tgz";
        sha1 = "988df33feab191ef799a61369dd76c17adf957ea";
      };
    }

    {
      name = "dashdash-1.14.1.tgz";
      path = fetchurl {
        name = "dashdash-1.14.1.tgz";
        url  = "https://registry.yarnpkg.com/dashdash/-/dashdash-1.14.1.tgz";
        sha1 = "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0";
      };
    }

    {
      name = "death-1.0.0.tgz";
      path = fetchurl {
        name = "death-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/death/-/death-1.0.0.tgz";
        sha1 = "4d46e15488d4b636b699f0671b04632d752fd2de";
      };
    }

    {
      name = "debug-2.6.0.tgz";
      path = fetchurl {
        name = "debug-2.6.0.tgz";
        url  = "https://registry.yarnpkg.com/debug/-/debug-2.6.0.tgz";
        sha1 = "bc596bcabe7617f11d9fa15361eded5608b8499b";
      };
    }

    {
      name = "defaults-1.0.3.tgz";
      path = fetchurl {
        name = "defaults-1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/defaults/-/defaults-1.0.3.tgz";
        sha1 = "c656051e9817d9ff08ed881477f3fe4019f3ef7d";
      };
    }

    {
      name = "delayed-stream-1.0.0.tgz";
      path = fetchurl {
        name = "delayed-stream-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    }

    {
      name = "delegates-1.0.0.tgz";
      path = fetchurl {
        name = "delegates-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz";
        sha1 = "84c6e159b81904fdca59a0ef44cd870d31250f9a";
      };
    }

    {
      name = "detect-indent-4.0.0.tgz";
      path = fetchurl {
        name = "detect-indent-4.0.0.tgz";
        url  = "https://registry.yarnpkg.com/detect-indent/-/detect-indent-4.0.0.tgz";
        sha1 = "f76d064352cdf43a1cb6ce619c4ee3a9475de208";
      };
    }

    {
      name = "diff-2.2.3.tgz";
      path = fetchurl {
        name = "diff-2.2.3.tgz";
        url  = "https://registry.yarnpkg.com/diff/-/diff-2.2.3.tgz";
        sha1 = "60eafd0d28ee906e4e8ff0a52c1229521033bf99";
      };
    }

    {
      name = "ecc-jsbn-0.1.1.tgz";
      path = fetchurl {
        name = "ecc-jsbn-0.1.1.tgz";
        url  = "https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.1.tgz";
        sha1 = "0fc73a9ed5f0d53c38193398523ef7e543777505";
      };
    }

    {
      name = "end-of-stream-1.1.0.tgz";
      path = fetchurl {
        name = "end-of-stream-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.1.0.tgz";
        sha1 = "e9353258baa9108965efc41cb0ef8ade2f3cfb07";
      };
    }

    {
      name = "escape-string-regexp-1.0.5.tgz";
      path = fetchurl {
        name = "escape-string-regexp-1.0.5.tgz";
        url  = "https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
      };
    }

    {
      name = "exit-hook-1.1.1.tgz";
      path = fetchurl {
        name = "exit-hook-1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/exit-hook/-/exit-hook-1.1.1.tgz";
        sha1 = "f05ca233b48c05d54fff07765df8507e95c02ff8";
      };
    }

    {
      name = "extend-3.0.0.tgz";
      path = fetchurl {
        name = "extend-3.0.0.tgz";
        url  = "https://registry.yarnpkg.com/extend/-/extend-3.0.0.tgz";
        sha1 = "5a474353b9f3353ddd8176dfd37b91c83a46f1d4";
      };
    }

    {
      name = "external-editor-1.1.1.tgz";
      path = fetchurl {
        name = "external-editor-1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/external-editor/-/external-editor-1.1.1.tgz";
        sha1 = "12d7b0db850f7ff7e7081baf4005700060c4600b";
      };
    }

    {
      name = "extsprintf-1.0.2.tgz";
      path = fetchurl {
        name = "extsprintf-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.0.2.tgz";
        sha1 = "e1080e0658e300b06294990cc70e1502235fd550";
      };
    }

    {
      name = "figures-1.7.0.tgz";
      path = fetchurl {
        name = "figures-1.7.0.tgz";
        url  = "https://registry.yarnpkg.com/figures/-/figures-1.7.0.tgz";
        sha1 = "cbe1e3affcf1cd44b80cadfed28dc793a9701d2e";
      };
    }

    {
      name = "forever-agent-0.6.1.tgz";
      path = fetchurl {
        name = "forever-agent-0.6.1.tgz";
        url  = "https://registry.yarnpkg.com/forever-agent/-/forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      };
    }

    {
      name = "form-data-2.1.2.tgz";
      path = fetchurl {
        name = "form-data-2.1.2.tgz";
        url  = "https://registry.yarnpkg.com/form-data/-/form-data-2.1.2.tgz";
        sha1 = "89c3534008b97eada4cbb157d58f6f5df025eae4";
      };
    }

    {
      name = "fs.realpath-1.0.0.tgz";
      path = fetchurl {
        name = "fs.realpath-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    }

    {
      name = "fstream-1.0.10.tgz";
      path = fetchurl {
        name = "fstream-1.0.10.tgz";
        url  = "https://registry.yarnpkg.com/fstream/-/fstream-1.0.10.tgz";
        sha1 = "604e8a92fe26ffd9f6fae30399d4984e1ab22822";
      };
    }

    {
      name = "gauge-2.7.2.tgz";
      path = fetchurl {
        name = "gauge-2.7.2.tgz";
        url  = "https://registry.yarnpkg.com/gauge/-/gauge-2.7.2.tgz";
        sha1 = "15cecc31b02d05345a5d6b0e171cdb3ad2307774";
      };
    }

    {
      name = "generate-function-2.0.0.tgz";
      path = fetchurl {
        name = "generate-function-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/generate-function/-/generate-function-2.0.0.tgz";
        sha1 = "6858fe7c0969b7d4e9093337647ac79f60dfbe74";
      };
    }

    {
      name = "generate-object-property-1.2.0.tgz";
      path = fetchurl {
        name = "generate-object-property-1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/generate-object-property/-/generate-object-property-1.2.0.tgz";
        sha1 = "9c0e1c40308ce804f4783618b937fa88f99d50d0";
      };
    }

    {
      name = "getpass-0.1.6.tgz";
      path = fetchurl {
        name = "getpass-0.1.6.tgz";
        url  = "https://registry.yarnpkg.com/getpass/-/getpass-0.1.6.tgz";
        sha1 = "283ffd9fc1256840875311c1b60e8c40187110e6";
      };
    }

    {
      name = "glob-7.1.1.tgz";
      path = fetchurl {
        name = "glob-7.1.1.tgz";
        url  = "https://registry.yarnpkg.com/glob/-/glob-7.1.1.tgz";
        sha1 = "805211df04faaf1c63a3600306cdf5ade50b2ec8";
      };
    }

    {
      name = "graceful-fs-4.1.11.tgz";
      path = fetchurl {
        name = "graceful-fs-4.1.11.tgz";
        url  = "https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.1.11.tgz";
        sha1 = "0e8bdfe4d1ddb8854d64e04ea7c00e2a026e5658";
      };
    }

    {
      name = "graceful-readlink-1.0.1.tgz";
      path = fetchurl {
        name = "graceful-readlink-1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/graceful-readlink/-/graceful-readlink-1.0.1.tgz";
        sha1 = "4cafad76bc62f02fa039b2f94e9a3dd3a391a725";
      };
    }

    {
      name = "har-validator-2.0.6.tgz";
      path = fetchurl {
        name = "har-validator-2.0.6.tgz";
        url  = "https://registry.yarnpkg.com/har-validator/-/har-validator-2.0.6.tgz";
        sha1 = "cdcbc08188265ad119b6a5a7c8ab70eecfb5d27d";
      };
    }

    {
      name = "has-ansi-2.0.0.tgz";
      path = fetchurl {
        name = "has-ansi-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-ansi/-/has-ansi-2.0.0.tgz";
        sha1 = "34f5049ce1ecdf2b0649af3ef24e45ed35416d91";
      };
    }

    {
      name = "has-unicode-2.0.1.tgz";
      path = fetchurl {
        name = "has-unicode-2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz";
        sha1 = "e0e6fe6a28cf51138855e086d1691e771de2a8b9";
      };
    }

    {
      name = "hawk-3.1.3.tgz";
      path = fetchurl {
        name = "hawk-3.1.3.tgz";
        url  = "https://registry.yarnpkg.com/hawk/-/hawk-3.1.3.tgz";
        sha1 = "078444bd7c1640b0fe540d2c9b73d59678e8e1c4";
      };
    }

    {
      name = "hoek-2.16.3.tgz";
      path = fetchurl {
        name = "hoek-2.16.3.tgz";
        url  = "https://registry.yarnpkg.com/hoek/-/hoek-2.16.3.tgz";
        sha1 = "20bb7403d3cea398e91dc4710a8ff1b8274a25ed";
      };
    }

    {
      name = "http-signature-1.1.1.tgz";
      path = fetchurl {
        name = "http-signature-1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/http-signature/-/http-signature-1.1.1.tgz";
        sha1 = "df72e267066cd0ac67fb76adf8e134a8fbcf91bf";
      };
    }

    {
      name = "inflight-1.0.6.tgz";
      path = fetchurl {
        name = "inflight-1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    }

    {
      name = "inherits-2.0.3.tgz";
      path = fetchurl {
        name = "inherits-2.0.3.tgz";
        url  = "https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz";
        sha1 = "633c2c83e3da42a502f52466022480f4208261de";
      };
    }

    {
      name = "ini-1.3.4.tgz";
      path = fetchurl {
        name = "ini-1.3.4.tgz";
        url  = "https://registry.yarnpkg.com/ini/-/ini-1.3.4.tgz";
        sha1 = "0537cb79daf59b59a1a517dff706c86ec039162e";
      };
    }

    {
      name = "inquirer-1.2.3.tgz";
      path = fetchurl {
        name = "inquirer-1.2.3.tgz";
        url  = "https://registry.yarnpkg.com/inquirer/-/inquirer-1.2.3.tgz";
        sha1 = "4dec6f32f37ef7bb0b2ed3f1d1a5c3f545074918";
      };
    }

    {
      name = "invariant-2.2.2.tgz";
      path = fetchurl {
        name = "invariant-2.2.2.tgz";
        url  = "https://registry.yarnpkg.com/invariant/-/invariant-2.2.2.tgz";
        sha1 = "9e1f56ac0acdb6bf303306f338be3b204ae60360";
      };
    }

    {
      name = "is-builtin-module-1.0.0.tgz";
      path = fetchurl {
        name = "is-builtin-module-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-1.0.0.tgz";
        sha1 = "540572d34f7ac3119f8f76c30cbc1b1e037affbe";
      };
    }

    {
      name = "is-ci-1.0.10.tgz";
      path = fetchurl {
        name = "is-ci-1.0.10.tgz";
        url  = "https://registry.yarnpkg.com/is-ci/-/is-ci-1.0.10.tgz";
        sha1 = "f739336b2632365061a9d48270cd56ae3369318e";
      };
    }

    {
      name = "is-finite-1.0.2.tgz";
      path = fetchurl {
        name = "is-finite-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-finite/-/is-finite-1.0.2.tgz";
        sha1 = "cc6677695602be550ef11e8b4aa6305342b6d0aa";
      };
    }

    {
      name = "is-fullwidth-code-point-1.0.0.tgz";
      path = fetchurl {
        name = "is-fullwidth-code-point-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz";
        sha1 = "ef9e31386f031a7f0d643af82fde50c457ef00cb";
      };
    }

    {
      name = "is-my-json-valid-2.15.0.tgz";
      path = fetchurl {
        name = "is-my-json-valid-2.15.0.tgz";
        url  = "https://registry.yarnpkg.com/is-my-json-valid/-/is-my-json-valid-2.15.0.tgz";
        sha1 = "936edda3ca3c211fd98f3b2d3e08da43f7b2915b";
      };
    }

    {
      name = "is-promise-2.1.0.tgz";
      path = fetchurl {
        name = "is-promise-2.1.0.tgz";
        url  = "https://registry.yarnpkg.com/is-promise/-/is-promise-2.1.0.tgz";
        sha1 = "79a2a9ece7f096e80f36d2b2f3bc16c1ff4bf3fa";
      };
    }

    {
      name = "is-property-1.0.2.tgz";
      path = fetchurl {
        name = "is-property-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-property/-/is-property-1.0.2.tgz";
        sha1 = "57fe1c4e48474edd65b09911f26b1cd4095dda84";
      };
    }

    {
      name = "is-typedarray-1.0.0.tgz";
      path = fetchurl {
        name = "is-typedarray-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz";
        sha1 = "e479c80858df0c1b11ddda6940f96011fcda4a9a";
      };
    }

    {
      name = "is-utf8-0.2.1.tgz";
      path = fetchurl {
        name = "is-utf8-0.2.1.tgz";
        url  = "https://registry.yarnpkg.com/is-utf8/-/is-utf8-0.2.1.tgz";
        sha1 = "4b0da1442104d1b336340e80797e865cf39f7d72";
      };
    }

    {
      name = "isarray-1.0.0.tgz";
      path = fetchurl {
        name = "isarray-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz";
        sha1 = "bb935d48582cba168c06834957a54a3e07124f11";
      };
    }

    {
      name = "isexe-1.1.2.tgz";
      path = fetchurl {
        name = "isexe-1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/isexe/-/isexe-1.1.2.tgz";
        sha1 = "36f3e22e60750920f5e7241a476a8c6a42275ad0";
      };
    }

    {
      name = "isstream-0.1.2.tgz";
      path = fetchurl {
        name = "isstream-0.1.2.tgz";
        url  = "https://registry.yarnpkg.com/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    }

    {
      name = "jodid25519-1.0.2.tgz";
      path = fetchurl {
        name = "jodid25519-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/jodid25519/-/jodid25519-1.0.2.tgz";
        sha1 = "06d4912255093419477d425633606e0e90782967";
      };
    }

    {
      name = "js-tokens-2.0.0.tgz";
      path = fetchurl {
        name = "js-tokens-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/js-tokens/-/js-tokens-2.0.0.tgz";
        sha1 = "79903f5563ee778cc1162e6dcf1a0027c97f9cb5";
      };
    }

    {
      name = "jsbn-0.1.0.tgz";
      path = fetchurl {
        name = "jsbn-0.1.0.tgz";
        url  = "https://registry.yarnpkg.com/jsbn/-/jsbn-0.1.0.tgz";
        sha1 = "650987da0dd74f4ebf5a11377a2aa2d273e97dfd";
      };
    }

    {
      name = "json-schema-0.2.3.tgz";
      path = fetchurl {
        name = "json-schema-0.2.3.tgz";
        url  = "https://registry.yarnpkg.com/json-schema/-/json-schema-0.2.3.tgz";
        sha1 = "b480c892e59a2f05954ce727bd3f2a4e882f9e13";
      };
    }

    {
      name = "json-stringify-safe-5.0.1.tgz";
      path = fetchurl {
        name = "json-stringify-safe-5.0.1.tgz";
        url  = "https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      };
    }

    {
      name = "jsonpointer-4.0.1.tgz";
      path = fetchurl {
        name = "jsonpointer-4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/jsonpointer/-/jsonpointer-4.0.1.tgz";
        sha1 = "4fd92cb34e0e9db3c89c8622ecf51f9b978c6cb9";
      };
    }

    {
      name = "jsprim-1.3.1.tgz";
      path = fetchurl {
        name = "jsprim-1.3.1.tgz";
        url  = "https://registry.yarnpkg.com/jsprim/-/jsprim-1.3.1.tgz";
        sha1 = "2a7256f70412a29ee3670aaca625994c4dcff252";
      };
    }

    {
      name = "leven-2.0.0.tgz";
      path = fetchurl {
        name = "leven-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/leven/-/leven-2.0.0.tgz";
        sha1 = "74c45744439550da185801912829f61d22071bc1";
      };
    }

    {
      name = "lodash-4.17.4.tgz";
      path = fetchurl {
        name = "lodash-4.17.4.tgz";
        url  = "https://registry.yarnpkg.com/lodash/-/lodash-4.17.4.tgz";
        sha1 = "78203a4d1c328ae1d86dca6460e369b57f4055ae";
      };
    }

    {
      name = "loose-envify-1.3.0.tgz";
      path = fetchurl {
        name = "loose-envify-1.3.0.tgz";
        url  = "https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.3.0.tgz";
        sha1 = "6b26248c42f6d4fa4b0d8542f78edfcde35642a8";
      };
    }

    {
      name = "loud-rejection-1.6.0.tgz";
      path = fetchurl {
        name = "loud-rejection-1.6.0.tgz";
        url  = "https://registry.yarnpkg.com/loud-rejection/-/loud-rejection-1.6.0.tgz";
        sha1 = "5b46f80147edee578870f086d04821cf998e551f";
      };
    }

    {
      name = "mime-db-1.26.0.tgz";
      path = fetchurl {
        name = "mime-db-1.26.0.tgz";
        url  = "https://registry.yarnpkg.com/mime-db/-/mime-db-1.26.0.tgz";
        sha1 = "eaffcd0e4fc6935cf8134da246e2e6c35305adff";
      };
    }

    {
      name = "mime-types-2.1.14.tgz";
      path = fetchurl {
        name = "mime-types-2.1.14.tgz";
        url  = "https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.14.tgz";
        sha1 = "f7ef7d97583fcaf3b7d282b6f8b5679dab1e94ee";
      };
    }

    {
      name = "minimatch-3.0.3.tgz";
      path = fetchurl {
        name = "minimatch-3.0.3.tgz";
        url  = "https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.3.tgz";
        sha1 = "2a4e4090b96b2db06a9d7df01055a62a77c9b774";
      };
    }

    {
      name = "minimist-0.0.8.tgz";
      path = fetchurl {
        name = "minimist-0.0.8.tgz";
        url  = "https://registry.yarnpkg.com/minimist/-/minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      };
    }

    {
      name = "mkdirp-0.5.1.tgz";
      path = fetchurl {
        name = "mkdirp-0.5.1.tgz";
        url  = "https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.1.tgz";
        sha1 = "30057438eac6cf7f8c4767f38648d6697d75c903";
      };
    }

    {
      name = "ms-0.7.2.tgz";
      path = fetchurl {
        name = "ms-0.7.2.tgz";
        url  = "https://registry.yarnpkg.com/ms/-/ms-0.7.2.tgz";
        sha1 = "ae25cf2512b3885a1d95d7f037868d8431124765";
      };
    }

    {
      name = "mute-stream-0.0.6.tgz";
      path = fetchurl {
        name = "mute-stream-0.0.6.tgz";
        url  = "https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.6.tgz";
        sha1 = "48962b19e169fd1dfc240b3f1e7317627bbc47db";
      };
    }

    {
      name = "mute-stream-0.0.7.tgz";
      path = fetchurl {
        name = "mute-stream-0.0.7.tgz";
        url  = "https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.7.tgz";
        sha1 = "3075ce93bc21b8fab43e1bc4da7e8115ed1e7bab";
      };
    }

    {
      name = "node-emoji-1.5.0.tgz";
      path = fetchurl {
        name = "node-emoji-1.5.0.tgz";
        url  = "https://registry.yarnpkg.com/node-emoji/-/node-emoji-1.5.0.tgz";
        sha1 = "9a0d9fe03fd43afa357d6d8e439aa31e599959b7";
      };
    }

    {
      name = "node-gyp-3.5.0.tgz";
      path = fetchurl {
        name = "node-gyp-3.5.0.tgz";
        url  = "https://registry.yarnpkg.com/node-gyp/-/node-gyp-3.5.0.tgz";
        sha1 = "a8fe5e611d079ec16348a3eb960e78e11c85274a";
      };
    }

    {
      name = "nopt-3.0.6.tgz";
      path = fetchurl {
        name = "nopt-3.0.6.tgz";
        url  = "https://registry.yarnpkg.com/nopt/-/nopt-3.0.6.tgz";
        sha1 = "c6465dbf08abcd4db359317f79ac68a646b28ff9";
      };
    }

    {
      name = "npmlog-4.0.2.tgz";
      path = fetchurl {
        name = "npmlog-4.0.2.tgz";
        url  = "https://registry.yarnpkg.com/npmlog/-/npmlog-4.0.2.tgz";
        sha1 = "d03950e0e78ce1527ba26d2a7592e9348ac3e75f";
      };
    }

    {
      name = "number-is-nan-1.0.1.tgz";
      path = fetchurl {
        name = "number-is-nan-1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz";
        sha1 = "097b602b53422a522c1afb8790318336941a011d";
      };
    }

    {
      name = "oauth-sign-0.8.2.tgz";
      path = fetchurl {
        name = "oauth-sign-0.8.2.tgz";
        url  = "https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.8.2.tgz";
        sha1 = "46a6ab7f0aead8deae9ec0565780b7d4efeb9d43";
      };
    }

    {
      name = "object-assign-4.1.0.tgz";
      path = fetchurl {
        name = "object-assign-4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.0.tgz";
        sha1 = "7a3b3d0e98063d43f4c03f2e8ae6cd51a86883a0";
      };
    }

    {
      name = "object-path-0.11.3.tgz";
      path = fetchurl {
        name = "object-path-0.11.3.tgz";
        url  = "https://registry.yarnpkg.com/object-path/-/object-path-0.11.3.tgz";
        sha1 = "3e21a42ad07234d815429ae9e15c1c5f38050554";
      };
    }

    {
      name = "once-1.3.3.tgz";
      path = fetchurl {
        name = "once-1.3.3.tgz";
        url  = "https://registry.yarnpkg.com/once/-/once-1.3.3.tgz";
        sha1 = "b2e261557ce4c314ec8304f3fa82663e4297ca20";
      };
    }

    {
      name = "onetime-1.1.0.tgz";
      path = fetchurl {
        name = "onetime-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/onetime/-/onetime-1.1.0.tgz";
        sha1 = "a1f7838f8314c516f05ecefcbc4ccfe04b4ed789";
      };
    }

    {
      name = "os-homedir-1.0.2.tgz";
      path = fetchurl {
        name = "os-homedir-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz";
        sha1 = "ffbc4988336e0e833de0c168c7ef152121aa7fb3";
      };
    }

    {
      name = "os-shim-0.1.3.tgz";
      path = fetchurl {
        name = "os-shim-0.1.3.tgz";
        url  = "https://registry.yarnpkg.com/os-shim/-/os-shim-0.1.3.tgz";
        sha1 = "6b62c3791cf7909ea35ed46e17658bb417cb3917";
      };
    }

    {
      name = "os-tmpdir-1.0.2.tgz";
      path = fetchurl {
        name = "os-tmpdir-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz";
        sha1 = "bbe67406c79aa85c5cfec766fe5734555dfa1274";
      };
    }

    {
      name = "osenv-0.1.4.tgz";
      path = fetchurl {
        name = "osenv-0.1.4.tgz";
        url  = "https://registry.yarnpkg.com/osenv/-/osenv-0.1.4.tgz";
        sha1 = "42fe6d5953df06c8064be6f176c3d05aaaa34644";
      };
    }

    {
      name = "path-is-absolute-1.0.1.tgz";
      path = fetchurl {
        name = "path-is-absolute-1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    }

    {
      name = "pinkie-promise-2.0.1.tgz";
      path = fetchurl {
        name = "pinkie-promise-2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz";
        sha1 = "2135d6dfa7a358c069ac9b178776288228450ffa";
      };
    }

    {
      name = "pinkie-2.0.4.tgz";
      path = fetchurl {
        name = "pinkie-2.0.4.tgz";
        url  = "https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz";
        sha1 = "72556b80cfa0d48a974e80e77248e80ed4f7f870";
      };
    }

    {
      name = "process-nextick-args-1.0.7.tgz";
      path = fetchurl {
        name = "process-nextick-args-1.0.7.tgz";
        url  = "https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-1.0.7.tgz";
        sha1 = "150e20b756590ad3f91093f25a4f2ad8bff30ba3";
      };
    }

    {
      name = "proper-lockfile-2.0.0.tgz";
      path = fetchurl {
        name = "proper-lockfile-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/proper-lockfile/-/proper-lockfile-2.0.0.tgz";
        sha1 = "b21f5e79bcbb6b4e23eeeced15cfc7f63e8a2e55";
      };
    }

    {
      name = "punycode-1.4.1.tgz";
      path = fetchurl {
        name = "punycode-1.4.1.tgz";
        url  = "https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz";
        sha1 = "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e";
      };
    }

    {
      name = "qs-6.3.0.tgz";
      path = fetchurl {
        name = "qs-6.3.0.tgz";
        url  = "https://registry.yarnpkg.com/qs/-/qs-6.3.0.tgz";
        sha1 = "f403b264f23bc01228c74131b407f18d5ea5d442";
      };
    }

    {
      name = "read-1.0.7.tgz";
      path = fetchurl {
        name = "read-1.0.7.tgz";
        url  = "https://registry.yarnpkg.com/read/-/read-1.0.7.tgz";
        sha1 = "b3da19bd052431a97671d44a42634adf710b40c4";
      };
    }

    {
      name = "readable-stream-2.2.2.tgz";
      path = fetchurl {
        name = "readable-stream-2.2.2.tgz";
        url  = "https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.2.2.tgz";
        sha1 = "a9e6fec3c7dda85f8bb1b3ba7028604556fc825e";
      };
    }

    {
      name = "regenerator-runtime-0.10.1.tgz";
      path = fetchurl {
        name = "regenerator-runtime-0.10.1.tgz";
        url  = "https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.10.1.tgz";
        sha1 = "257f41961ce44558b18f7814af48c17559f9faeb";
      };
    }

    {
      name = "repeating-2.0.1.tgz";
      path = fetchurl {
        name = "repeating-2.0.1.tgz";
        url  = "https://registry.yarnpkg.com/repeating/-/repeating-2.0.1.tgz";
        sha1 = "5214c53a926d3552707527fbab415dbc08d06dda";
      };
    }

    {
      name = "request-capture-har-1.1.4.tgz";
      path = fetchurl {
        name = "request-capture-har-1.1.4.tgz";
        url  = "https://registry.yarnpkg.com/request-capture-har/-/request-capture-har-1.1.4.tgz";
        sha1 = "e6ad76eb8e7a1714553fdbeef32cd4518e4e2013";
      };
    }

    {
      name = "request-2.79.0.tgz";
      path = fetchurl {
        name = "request-2.79.0.tgz";
        url  = "https://registry.yarnpkg.com/request/-/request-2.79.0.tgz";
        sha1 = "4dfe5bf6be8b8cdc37fcf93e04b65577722710de";
      };
    }

    {
      name = "restore-cursor-1.0.1.tgz";
      path = fetchurl {
        name = "restore-cursor-1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-1.0.1.tgz";
        sha1 = "34661f46886327fed2991479152252df92daa541";
      };
    }

    {
      name = "retry-0.10.1.tgz";
      path = fetchurl {
        name = "retry-0.10.1.tgz";
        url  = "https://registry.yarnpkg.com/retry/-/retry-0.10.1.tgz";
        sha1 = "e76388d217992c252750241d3d3956fed98d8ff4";
      };
    }

    {
      name = "rimraf-2.5.4.tgz";
      path = fetchurl {
        name = "rimraf-2.5.4.tgz";
        url  = "https://registry.yarnpkg.com/rimraf/-/rimraf-2.5.4.tgz";
        sha1 = "96800093cbf1a0c86bd95b4625467535c29dfa04";
      };
    }

    {
      name = "roadrunner-1.1.0.tgz";
      path = fetchurl {
        name = "roadrunner-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/roadrunner/-/roadrunner-1.1.0.tgz";
        sha1 = "1180a30d64e1970d8f55dd8cb0da8ffccecad71e";
      };
    }

    {
      name = "run-async-2.3.0.tgz";
      path = fetchurl {
        name = "run-async-2.3.0.tgz";
        url  = "https://registry.yarnpkg.com/run-async/-/run-async-2.3.0.tgz";
        sha1 = "0371ab4ae0bdd720d4166d7dfda64ff7a445a6c0";
      };
    }

    {
      name = "rx-4.1.0.tgz";
      path = fetchurl {
        name = "rx-4.1.0.tgz";
        url  = "https://registry.yarnpkg.com/rx/-/rx-4.1.0.tgz";
        sha1 = "a5f13ff79ef3b740fe30aa803fb09f98805d4782";
      };
    }

    {
      name = "semver-5.3.0.tgz";
      path = fetchurl {
        name = "semver-5.3.0.tgz";
        url  = "https://registry.yarnpkg.com/semver/-/semver-5.3.0.tgz";
        sha1 = "9b2ce5d3de02d17c6012ad326aa6b4d0cf54f94f";
      };
    }

    {
      name = "set-blocking-2.0.0.tgz";
      path = fetchurl {
        name = "set-blocking-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz";
        sha1 = "045f9782d011ae9a6803ddd382b24392b3d890f7";
      };
    }

    {
      name = "signal-exit-3.0.2.tgz";
      path = fetchurl {
        name = "signal-exit-3.0.2.tgz";
        url  = "https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.2.tgz";
        sha1 = "b5fdc08f1287ea1178628e415e25132b73646c6d";
      };
    }

    {
      name = "sntp-1.0.9.tgz";
      path = fetchurl {
        name = "sntp-1.0.9.tgz";
        url  = "https://registry.yarnpkg.com/sntp/-/sntp-1.0.9.tgz";
        sha1 = "6541184cc90aeea6c6e7b35e2659082443c66198";
      };
    }

    {
      name = "spawn-sync-1.0.15.tgz";
      path = fetchurl {
        name = "spawn-sync-1.0.15.tgz";
        url  = "https://registry.yarnpkg.com/spawn-sync/-/spawn-sync-1.0.15.tgz";
        sha1 = "b00799557eb7fb0c8376c29d44e8a1ea67e57476";
      };
    }

    {
      name = "spdx-correct-1.0.2.tgz";
      path = fetchurl {
        name = "spdx-correct-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-1.0.2.tgz";
        sha1 = "4b3073d933ff51f3912f03ac5519498a4150db40";
      };
    }

    {
      name = "spdx-expression-parse-1.0.4.tgz";
      path = fetchurl {
        name = "spdx-expression-parse-1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-1.0.4.tgz";
        sha1 = "9bdf2f20e1f40ed447fbe273266191fced51626c";
      };
    }

    {
      name = "spdx-license-ids-1.2.2.tgz";
      path = fetchurl {
        name = "spdx-license-ids-1.2.2.tgz";
        url  = "https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-1.2.2.tgz";
        sha1 = "c9df7a3424594ade6bd11900d596696dc06bac57";
      };
    }

    {
      name = "sshpk-1.10.2.tgz";
      path = fetchurl {
        name = "sshpk-1.10.2.tgz";
        url  = "https://registry.yarnpkg.com/sshpk/-/sshpk-1.10.2.tgz";
        sha1 = "d5a804ce22695515638e798dbe23273de070a5fa";
      };
    }

    {
      name = "string-width-1.0.2.tgz";
      path = fetchurl {
        name = "string-width-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz";
        sha1 = "118bdf5b8cdc51a2a7e70d211e07e2b0b9b107d3";
      };
    }

    {
      name = "string.prototype.codepointat-0.2.0.tgz";
      path = fetchurl {
        name = "string.prototype.codepointat-0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.codepointat/-/string.prototype.codepointat-0.2.0.tgz";
        sha1 = "6b26e9bd3afcaa7be3b4269b526de1b82000ac78";
      };
    }

    {
      name = "string_decoder-0.10.31.tgz";
      path = fetchurl {
        name = "string_decoder-0.10.31.tgz";
        url  = "https://registry.yarnpkg.com/string_decoder/-/string_decoder-0.10.31.tgz";
        sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
      };
    }

    {
      name = "stringstream-0.0.5.tgz";
      path = fetchurl {
        name = "stringstream-0.0.5.tgz";
        url  = "https://registry.yarnpkg.com/stringstream/-/stringstream-0.0.5.tgz";
        sha1 = "4e484cd4de5a0bbbee18e46307710a8a81621878";
      };
    }

    {
      name = "strip-ansi-3.0.1.tgz";
      path = fetchurl {
        name = "strip-ansi-3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz";
        sha1 = "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf";
      };
    }

    {
      name = "strip-bom-2.0.0.tgz";
      path = fetchurl {
        name = "strip-bom-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/strip-bom/-/strip-bom-2.0.0.tgz";
        sha1 = "6219a85616520491f35788bdbf1447a99c7e6b0e";
      };
    }

    {
      name = "supports-color-0.2.0.tgz";
      path = fetchurl {
        name = "supports-color-0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/supports-color/-/supports-color-0.2.0.tgz";
        sha1 = "d92de2694eb3f67323973d7ae3d8b55b4c22190a";
      };
    }

    {
      name = "supports-color-2.0.0.tgz";
      path = fetchurl {
        name = "supports-color-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/supports-color/-/supports-color-2.0.0.tgz";
        sha1 = "535d045ce6b6363fa40117084629995e9df324c7";
      };
    }

    {
      name = "tar-stream-1.5.2.tgz";
      path = fetchurl {
        name = "tar-stream-1.5.2.tgz";
        url  = "https://registry.yarnpkg.com/tar-stream/-/tar-stream-1.5.2.tgz";
        sha1 = "fbc6c6e83c1a19d4cb48c7d96171fc248effc7bf";
      };
    }

    {
      name = "tar-2.2.1.tgz";
      path = fetchurl {
        name = "tar-2.2.1.tgz";
        url  = "https://registry.yarnpkg.com/tar/-/tar-2.2.1.tgz";
        sha1 = "8e4d2a256c0e2185c6b18ad694aec968b83cb1d1";
      };
    }

    {
      name = "through-2.3.8.tgz";
      path = fetchurl {
        name = "through-2.3.8.tgz";
        url  = "https://registry.yarnpkg.com/through/-/through-2.3.8.tgz";
        sha1 = "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5";
      };
    }

    {
      name = "tmp-0.0.29.tgz";
      path = fetchurl {
        name = "tmp-0.0.29.tgz";
        url  = "https://registry.yarnpkg.com/tmp/-/tmp-0.0.29.tgz";
        sha1 = "f25125ff0dd9da3ccb0c2dd371ee1288bb9128c0";
      };
    }

    {
      name = "tough-cookie-2.3.2.tgz";
      path = fetchurl {
        name = "tough-cookie-2.3.2.tgz";
        url  = "https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.3.2.tgz";
        sha1 = "f081f76e4c85720e6c37a5faced737150d84072a";
      };
    }

    {
      name = "tunnel-agent-0.4.3.tgz";
      path = fetchurl {
        name = "tunnel-agent-0.4.3.tgz";
        url  = "https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.4.3.tgz";
        sha1 = "6373db76909fe570e08d73583365ed828a74eeeb";
      };
    }

    {
      name = "tweetnacl-0.14.5.tgz";
      path = fetchurl {
        name = "tweetnacl-0.14.5.tgz";
        url  = "https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz";
        sha1 = "5ae68177f192d4456269d108afa93ff8743f4f64";
      };
    }

    {
      name = "typedarray-0.0.6.tgz";
      path = fetchurl {
        name = "typedarray-0.0.6.tgz";
        url  = "https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz";
        sha1 = "867ac74e3864187b1d3d47d996a78ec5c8830777";
      };
    }

    {
      name = "user-home-2.0.0.tgz";
      path = fetchurl {
        name = "user-home-2.0.0.tgz";
        url  = "https://registry.yarnpkg.com/user-home/-/user-home-2.0.0.tgz";
        sha1 = "9c70bfd8169bc1dcbf48604e0f04b8b49cde9e9f";
      };
    }

    {
      name = "util-deprecate-1.0.2.tgz";
      path = fetchurl {
        name = "util-deprecate-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz";
        sha1 = "450d4dc9fa70de732762fbd2d4a28981419a0ccf";
      };
    }

    {
      name = "uuid-3.0.1.tgz";
      path = fetchurl {
        name = "uuid-3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/uuid/-/uuid-3.0.1.tgz";
        sha1 = "6544bba2dfda8c1cf17e629a3a305e2bb1fee6c1";
      };
    }

    {
      name = "validate-npm-package-license-3.0.1.tgz";
      path = fetchurl {
        name = "validate-npm-package-license-3.0.1.tgz";
        url  = "https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.1.tgz";
        sha1 = "2804babe712ad3379459acfbe24746ab2c303fbc";
      };
    }

    {
      name = "verror-1.3.6.tgz";
      path = fetchurl {
        name = "verror-1.3.6.tgz";
        url  = "https://registry.yarnpkg.com/verror/-/verror-1.3.6.tgz";
        sha1 = "cff5df12946d297d2baaefaa2689e25be01c005c";
      };
    }

    {
      name = "which-1.2.12.tgz";
      path = fetchurl {
        name = "which-1.2.12.tgz";
        url  = "https://registry.yarnpkg.com/which/-/which-1.2.12.tgz";
        sha1 = "de67b5e450269f194909ef23ece4ebe416fa1192";
      };
    }

    {
      name = "wide-align-1.1.0.tgz";
      path = fetchurl {
        name = "wide-align-1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.0.tgz";
        sha1 = "40edde802a71fea1f070da3e62dcda2e7add96ad";
      };
    }

    {
      name = "wrappy-1.0.2.tgz";
      path = fetchurl {
        name = "wrappy-1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    }

    {
      name = "xtend-4.0.1.tgz";
      path = fetchurl {
        name = "xtend-4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/xtend/-/xtend-4.0.1.tgz";
        sha1 = "a5c6d532be656e23db820efb943a1f04998d63af";
      };
    }

    {
      name = "yarn-0.19.0.tgz";
      path = fetchurl {
        name = "yarn-0.19.0.tgz";
        url  = "https://registry.yarnpkg.com/yarn/-/yarn-0.19.0.tgz";
        sha1 = "8dc8dda71466e8d64623fdbac9b586e83e02a088";
      };
    }
  ];
}
