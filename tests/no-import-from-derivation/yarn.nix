{fetchurl, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [

    {
      name = "acorn_es7_plugin___acorn_es7_plugin_1.1.7.tgz";
      path = fetchurl {
        name = "acorn_es7_plugin___acorn_es7_plugin_1.1.7.tgz";
        url  = "https://registry.yarnpkg.com/acorn-es7-plugin/-/acorn-es7-plugin-1.1.7.tgz";
        sha1 = "f2ee1f3228a90eead1245f9ab1922eb2e71d336b";
      };
    }

    {
      name = "acorn___acorn_5.7.3.tgz";
      path = fetchurl {
        name = "acorn___acorn_5.7.3.tgz";
        url  = "https://registry.yarnpkg.com/acorn/-/acorn-5.7.3.tgz";
        sha1 = "67aa231bf8812974b85235a96771eb6bd07ea279";
      };
    }

    {
      name = "array_filter___array_filter_1.0.0.tgz";
      path = fetchurl {
        name = "array_filter___array_filter_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/array-filter/-/array-filter-1.0.0.tgz";
        sha1 = "baf79e62e6ef4c2a4c0b831232daffec251f9d83";
      };
    }

    {
      name = "balanced_match___balanced_match_1.0.0.tgz";
      path = fetchurl {
        name = "balanced_match___balanced_match_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.0.tgz";
        sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
      };
    }

    {
      name = "benchmark___benchmark_2.1.4.tgz";
      path = fetchurl {
        name = "benchmark___benchmark_2.1.4.tgz";
        url  = "https://registry.yarnpkg.com/benchmark/-/benchmark-2.1.4.tgz";
        sha1 = "09f3de31c916425d498cc2ee565a0ebf3c2a5629";
      };
    }

    {
      name = "brace_expansion___brace_expansion_1.1.11.tgz";
      path = fetchurl {
        name = "brace_expansion___brace_expansion_1.1.11.tgz";
        url  = "https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha1 = "3c7fcbf529d87226f3d2f52b966ff5271eb441dd";
      };
    }

    {
      name = "call_signature___call_signature_0.0.2.tgz";
      path = fetchurl {
        name = "call_signature___call_signature_0.0.2.tgz";
        url  = "https://registry.yarnpkg.com/call-signature/-/call-signature-0.0.2.tgz";
        sha1 = "a84abc825a55ef4cb2b028bd74e205a65b9a4996";
      };
    }

    {
      name = "concat_map___concat_map_0.0.1.tgz";
      path = fetchurl {
        name = "concat_map___concat_map_0.0.1.tgz";
        url  = "https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    }

    {
      name = "core_js___core_js_2.5.7.tgz";
      path = fetchurl {
        name = "core_js___core_js_2.5.7.tgz";
        url  = "https://registry.yarnpkg.com/core-js/-/core-js-2.5.7.tgz";
        sha1 = "f972608ff0cead68b841a16a932d0b183791814e";
      };
    }

    {
      name = "deep_equal___deep_equal_1.0.1.tgz";
      path = fetchurl {
        name = "deep_equal___deep_equal_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/deep-equal/-/deep-equal-1.0.1.tgz";
        sha1 = "f5d260292b660e084eff4cdbc9f08ad3247448b5";
      };
    }

    {
      name = "define_properties___define_properties_1.1.3.tgz";
      path = fetchurl {
        name = "define_properties___define_properties_1.1.3.tgz";
        url  = "https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz";
        sha1 = "cf88da6cbee26fe6db7094f61d870cbd84cee9f1";
      };
    }

    {
      name = "defined___defined_1.0.0.tgz";
      path = fetchurl {
        name = "defined___defined_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/defined/-/defined-1.0.0.tgz";
        sha1 = "c98d9bcef75674188e110969151199e39b1fa693";
      };
    }

    {
      name = "diff_match_patch___diff_match_patch_1.0.4.tgz";
      path = fetchurl {
        name = "diff_match_patch___diff_match_patch_1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/diff-match-patch/-/diff-match-patch-1.0.4.tgz";
        sha1 = "6ac4b55237463761c4daf0dc603eb869124744b1";
      };
    }

    {
      name = "eastasianwidth___eastasianwidth_0.2.0.tgz";
      path = fetchurl {
        name = "eastasianwidth___eastasianwidth_0.2.0.tgz";
        url  = "https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz";
        sha1 = "696ce2ec0aa0e6ea93a397ffcf24aa7840c827cb";
      };
    }

    {
      name = "empower_core___empower_core_1.2.0.tgz";
      path = fetchurl {
        name = "empower_core___empower_core_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/empower-core/-/empower-core-1.2.0.tgz";
        sha1 = "ce3fb2484d5187fa29c23fba8344b0b2fdf5601c";
      };
    }

    {
      name = "empower___empower_1.3.1.tgz";
      path = fetchurl {
        name = "empower___empower_1.3.1.tgz";
        url  = "https://registry.yarnpkg.com/empower/-/empower-1.3.1.tgz";
        sha1 = "768979cbbb36d71d8f5edaab663deacb9dab916c";
      };
    }

    {
      name = "es_abstract___es_abstract_1.12.0.tgz";
      path = fetchurl {
        name = "es_abstract___es_abstract_1.12.0.tgz";
        url  = "https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.12.0.tgz";
        sha1 = "9dbbdd27c6856f0001421ca18782d786bf8a6165";
      };
    }

    {
      name = "es_to_primitive___es_to_primitive_1.2.0.tgz";
      path = fetchurl {
        name = "es_to_primitive___es_to_primitive_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.0.tgz";
        sha1 = "edf72478033456e8dda8ef09e00ad9650707f377";
      };
    }

    {
      name = "espurify___espurify_1.8.1.tgz";
      path = fetchurl {
        name = "espurify___espurify_1.8.1.tgz";
        url  = "https://registry.yarnpkg.com/espurify/-/espurify-1.8.1.tgz";
        sha1 = "5746c6c1ab42d302de10bd1d5bf7f0e8c0515056";
      };
    }

    {
      name = "estraverse___estraverse_4.2.0.tgz";
      path = fetchurl {
        name = "estraverse___estraverse_4.2.0.tgz";
        url  = "https://registry.yarnpkg.com/estraverse/-/estraverse-4.2.0.tgz";
        sha1 = "0dee3fed31fcd469618ce7342099fc1afa0bdb13";
      };
    }

    {
      name = "fast_check___fast_check_0.0.8.tgz";
      path = fetchurl {
        name = "fast_check___fast_check_0.0.8.tgz";
        url  = "https://registry.yarnpkg.com/fast-check/-/fast-check-0.0.8.tgz";
        sha1 = "d0d920d510b23c1304596e51a43bf9cbd31c3b1f";
      };
    }

    {
      name = "for_each___for_each_0.3.3.tgz";
      path = fetchurl {
        name = "for_each___for_each_0.3.3.tgz";
        url  = "https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz";
        sha1 = "69b447e88a0a5d32c3e7084f3f1710034b21376e";
      };
    }

    {
      name = "fs.realpath___fs.realpath_1.0.0.tgz";
      path = fetchurl {
        name = "fs.realpath___fs.realpath_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    }

    {
      name = "function_bind___function_bind_1.1.1.tgz";
      path = fetchurl {
        name = "function_bind___function_bind_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz";
        sha1 = "a56899d3ea3c9bab874bb9773b7c5ede92f4895d";
      };
    }

    {
      name = "glob___glob_7.1.3.tgz";
      path = fetchurl {
        name = "glob___glob_7.1.3.tgz";
        url  = "https://registry.yarnpkg.com/glob/-/glob-7.1.3.tgz";
        sha1 = "3960832d3f1574108342dafd3a67b332c0969df1";
      };
    }

    {
      name = "has_symbols___has_symbols_1.0.0.tgz";
      path = fetchurl {
        name = "has_symbols___has_symbols_1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.0.tgz";
        sha1 = "ba1a8f1af2a0fc39650f5c850367704122063b44";
      };
    }

    {
      name = "has___has_1.0.3.tgz";
      path = fetchurl {
        name = "has___has_1.0.3.tgz";
        url  = "https://registry.yarnpkg.com/has/-/has-1.0.3.tgz";
        sha1 = "722d7cbfc1f6aa8241f16dd814e011e1f41e8796";
      };
    }

    {
      name = "indexof___indexof_0.0.1.tgz";
      path = fetchurl {
        name = "indexof___indexof_0.0.1.tgz";
        url  = "https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz";
        sha1 = "82dc336d232b9062179d05ab3293a66059fd435d";
      };
    }

    {
      name = "inflight___inflight_1.0.6.tgz";
      path = fetchurl {
        name = "inflight___inflight_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    }

    {
      name = "inherits___inherits_2.0.3.tgz";
      path = fetchurl {
        name = "inherits___inherits_2.0.3.tgz";
        url  = "https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz";
        sha1 = "633c2c83e3da42a502f52466022480f4208261de";
      };
    }

    {
      name = "is_callable___is_callable_1.1.4.tgz";
      path = fetchurl {
        name = "is_callable___is_callable_1.1.4.tgz";
        url  = "https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.4.tgz";
        sha1 = "1e1adf219e1eeb684d691f9d6a05ff0d30a24d75";
      };
    }

    {
      name = "is_date_object___is_date_object_1.0.1.tgz";
      path = fetchurl {
        name = "is_date_object___is_date_object_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.1.tgz";
        sha1 = "9aa20eb6aeebbff77fbd33e74ca01b33581d3a16";
      };
    }

    {
      name = "is_regex___is_regex_1.0.4.tgz";
      path = fetchurl {
        name = "is_regex___is_regex_1.0.4.tgz";
        url  = "https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.4.tgz";
        sha1 = "5517489b547091b0930e095654ced25ee97e9491";
      };
    }

    {
      name = "is_symbol___is_symbol_1.0.2.tgz";
      path = fetchurl {
        name = "is_symbol___is_symbol_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.2.tgz";
        sha1 = "a055f6ae57192caee329e7a860118b497a950f38";
      };
    }

    {
      name = "lodash___lodash_4.17.11.tgz";
      path = fetchurl {
        name = "lodash___lodash_4.17.11.tgz";
        url  = "https://registry.yarnpkg.com/lodash/-/lodash-4.17.11.tgz";
        sha1 = "b39ea6229ef607ecd89e2c8df12536891cac9b8d";
      };
    }

    {
      name = "lorem_ipsum___lorem_ipsum_1.0.6.tgz";
      path = fetchurl {
        name = "lorem_ipsum___lorem_ipsum_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/lorem-ipsum/-/lorem-ipsum-1.0.6.tgz";
        sha1 = "69e9ab02bbb0991915d71b5559fe016d526f013f";
      };
    }

    {
      name = "minimatch___minimatch_3.0.4.tgz";
      path = fetchurl {
        name = "minimatch___minimatch_3.0.4.tgz";
        url  = "https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz";
        sha1 = "5166e286457f03306064be5497e8dbb0c3d32083";
      };
    }

    {
      name = "http___registry.npmjs.org_minimist___minimist_1.2.0.tgz";
      path = fetchurl {
        name = "http___registry.npmjs.org_minimist___minimist_1.2.0.tgz";
        url  = "http://registry.npmjs.org/minimist/-/minimist-1.2.0.tgz";
        sha1 = "a35008b20f41383eec1fb914f4cd5df79a264284";
      };
    }

    {
      name = "object_inspect___object_inspect_1.6.0.tgz";
      path = fetchurl {
        name = "object_inspect___object_inspect_1.6.0.tgz";
        url  = "https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.6.0.tgz";
        sha1 = "c70b6cbf72f274aab4c34c0c82f5167bf82cf15b";
      };
    }

    {
      name = "object_keys___object_keys_1.0.12.tgz";
      path = fetchurl {
        name = "object_keys___object_keys_1.0.12.tgz";
        url  = "https://registry.yarnpkg.com/object-keys/-/object-keys-1.0.12.tgz";
        sha1 = "09c53855377575310cca62f55bb334abff7b3ed2";
      };
    }

    {
      name = "once___once_1.4.0.tgz";
      path = fetchurl {
        name = "once___once_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    }

    {
      name = "path_is_absolute___path_is_absolute_1.0.1.tgz";
      path = fetchurl {
        name = "path_is_absolute___path_is_absolute_1.0.1.tgz";
        url  = "https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    }

    {
      name = "path_parse___path_parse_1.0.6.tgz";
      path = fetchurl {
        name = "path_parse___path_parse_1.0.6.tgz";
        url  = "https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.6.tgz";
        sha1 = "d62dbb5679405d72c4737ec58600e9ddcf06d24c";
      };
    }

    {
      name = "platform___platform_1.3.5.tgz";
      path = fetchurl {
        name = "platform___platform_1.3.5.tgz";
        url  = "https://registry.yarnpkg.com/platform/-/platform-1.3.5.tgz";
        sha1 = "fb6958c696e07e2918d2eeda0f0bc9448d733444";
      };
    }

    {
      name = "power_assert_context_formatter___power_assert_context_formatter_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_context_formatter___power_assert_context_formatter_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-context-formatter/-/power-assert-context-formatter-1.2.0.tgz";
        sha1 = "8fbe72692288ec5a7203cdf215c8b838a6061d2a";
      };
    }

    {
      name = "power_assert_context_reducer_ast___power_assert_context_reducer_ast_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_context_reducer_ast___power_assert_context_reducer_ast_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-context-reducer-ast/-/power-assert-context-reducer-ast-1.2.0.tgz";
        sha1 = "c7ca1c9e39a6fb717f7ac5fe9e76e192bf525df3";
      };
    }

    {
      name = "power_assert_context_traversal___power_assert_context_traversal_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_context_traversal___power_assert_context_traversal_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-context-traversal/-/power-assert-context-traversal-1.2.0.tgz";
        sha1 = "f6e71454baf640de5c1c9c270349f5c9ab0b2e94";
      };
    }

    {
      name = "power_assert_formatter___power_assert_formatter_1.4.1.tgz";
      path = fetchurl {
        name = "power_assert_formatter___power_assert_formatter_1.4.1.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-formatter/-/power-assert-formatter-1.4.1.tgz";
        sha1 = "5dc125ed50a3dfb1dda26c19347f3bf58ec2884a";
      };
    }

    {
      name = "power_assert_renderer_assertion___power_assert_renderer_assertion_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_renderer_assertion___power_assert_renderer_assertion_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-renderer-assertion/-/power-assert-renderer-assertion-1.2.0.tgz";
        sha1 = "3db6ffcda106b37bc1e06432ad0d748a682b147a";
      };
    }

    {
      name = "power_assert_renderer_base___power_assert_renderer_base_1.1.1.tgz";
      path = fetchurl {
        name = "power_assert_renderer_base___power_assert_renderer_base_1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-renderer-base/-/power-assert-renderer-base-1.1.1.tgz";
        sha1 = "96a650c6fd05ee1bc1f66b54ad61442c8b3f63eb";
      };
    }

    {
      name = "power_assert_renderer_comparison___power_assert_renderer_comparison_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_renderer_comparison___power_assert_renderer_comparison_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-renderer-comparison/-/power-assert-renderer-comparison-1.2.0.tgz";
        sha1 = "e4f88113225a69be8aa586ead05aef99462c0495";
      };
    }

    {
      name = "power_assert_renderer_diagram___power_assert_renderer_diagram_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_renderer_diagram___power_assert_renderer_diagram_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-renderer-diagram/-/power-assert-renderer-diagram-1.2.0.tgz";
        sha1 = "37f66e8542e5677c5b58e6d72b01c0d9a30e2219";
      };
    }

    {
      name = "power_assert_renderer_file___power_assert_renderer_file_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_renderer_file___power_assert_renderer_file_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-renderer-file/-/power-assert-renderer-file-1.2.0.tgz";
        sha1 = "3f4bebd9e1455d75cf2ac541e7bb515a87d4ce4b";
      };
    }

    {
      name = "power_assert_util_string_width___power_assert_util_string_width_1.2.0.tgz";
      path = fetchurl {
        name = "power_assert_util_string_width___power_assert_util_string_width_1.2.0.tgz";
        url  = "https://registry.yarnpkg.com/power-assert-util-string-width/-/power-assert-util-string-width-1.2.0.tgz";
        sha1 = "6e06d5e3581bb876c5d377c53109fffa95bd91a0";
      };
    }

    {
      name = "power_assert___power_assert_1.6.1.tgz";
      path = fetchurl {
        name = "power_assert___power_assert_1.6.1.tgz";
        url  = "https://registry.yarnpkg.com/power-assert/-/power-assert-1.6.1.tgz";
        sha1 = "b28cbc02ae808afd1431d0cd5093a39ac5a5b1fe";
      };
    }

    {
      name = "resolve___resolve_1.7.1.tgz";
      path = fetchurl {
        name = "resolve___resolve_1.7.1.tgz";
        url  = "https://registry.yarnpkg.com/resolve/-/resolve-1.7.1.tgz";
        sha1 = "aadd656374fd298aee895bc026b8297418677fd3";
      };
    }

    {
      name = "resumer___resumer_0.0.0.tgz";
      path = fetchurl {
        name = "resumer___resumer_0.0.0.tgz";
        url  = "https://registry.yarnpkg.com/resumer/-/resumer-0.0.0.tgz";
        sha1 = "f1e8f461e4064ba39e82af3cdc2a8c893d076759";
      };
    }

    {
      name = "string.prototype.trim___string.prototype.trim_1.1.2.tgz";
      path = fetchurl {
        name = "string.prototype.trim___string.prototype.trim_1.1.2.tgz";
        url  = "https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.1.2.tgz";
        sha1 = "d04de2c89e137f4d7d206f086b5ed2fae6be8cea";
      };
    }

    {
      name = "stringifier___stringifier_1.4.0.tgz";
      path = fetchurl {
        name = "stringifier___stringifier_1.4.0.tgz";
        url  = "https://registry.yarnpkg.com/stringifier/-/stringifier-1.4.0.tgz";
        sha1 = "d704581567f4526265d00ed8ecb354a02c3fec28";
      };
    }

    {
      name = "tape___tape_4.9.1.tgz";
      path = fetchurl {
        name = "tape___tape_4.9.1.tgz";
        url  = "https://registry.yarnpkg.com/tape/-/tape-4.9.1.tgz";
        sha1 = "1173d7337e040c76fbf42ec86fcabedc9b3805c9";
      };
    }

    {
      name = "http___registry.npmjs.org_through___through_2.3.8.tgz";
      path = fetchurl {
        name = "http___registry.npmjs.org_through___through_2.3.8.tgz";
        url  = "http://registry.npmjs.org/through/-/through-2.3.8.tgz";
        sha1 = "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5";
      };
    }

    {
      name = "traverse___traverse_0.6.6.tgz";
      path = fetchurl {
        name = "traverse___traverse_0.6.6.tgz";
        url  = "https://registry.yarnpkg.com/traverse/-/traverse-0.6.6.tgz";
        sha1 = "cbdf560fd7b9af632502fed40f918c157ea97137";
      };
    }

    {
      name = "type_name___type_name_2.0.2.tgz";
      path = fetchurl {
        name = "type_name___type_name_2.0.2.tgz";
        url  = "https://registry.yarnpkg.com/type-name/-/type-name-2.0.2.tgz";
        sha1 = "efe7d4123d8ac52afff7f40c7e4dec5266008fb4";
      };
    }

    {
      name = "universal_deep_strict_equal___universal_deep_strict_equal_1.2.2.tgz";
      path = fetchurl {
        name = "universal_deep_strict_equal___universal_deep_strict_equal_1.2.2.tgz";
        url  = "https://registry.yarnpkg.com/universal-deep-strict-equal/-/universal-deep-strict-equal-1.2.2.tgz";
        sha1 = "0da4ac2f73cff7924c81fa4de018ca562ca2b0a7";
      };
    }

    {
      name = "wrappy___wrappy_1.0.2.tgz";
      path = fetchurl {
        name = "wrappy___wrappy_1.0.2.tgz";
        url  = "https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    }

    {
      name = "xtend___xtend_4.0.1.tgz";
      path = fetchurl {
        name = "xtend___xtend_4.0.1.tgz";
        url  = "https://registry.yarnpkg.com/xtend/-/xtend-4.0.1.tgz";
        sha1 = "a5c6d532be656e23db820efb943a1f04998d63af";
      };
    }
  ];
}
