{fetchurl, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [

    {
      name = "lockfile-1.0.0.tgz";
      path = fetchurl {
        name = "lockfile-1.0.0.tgz";
        url  = "https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.0.0.tgz";
        sha1 = "33d1dbb659a23b81f87f048762b35a446172add3";
      };
    }

    {
      name = "yarn-lockfile-1.1.1.tgz";
      path = fetchurl {
        name = "yarn-lockfile-1.1.1.tgz";
        url  = "https://registry.yarnpkg.com/yarn-lockfile/-/yarn-lockfile-1.1.1.tgz";
        sha1 = "3e58898c601f3d2511e2b2abb4638088918849e9";
      };
    }
  ];
}
