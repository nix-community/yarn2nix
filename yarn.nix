{fetchurl, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [

    {
      name = "_yarnpkg_lockfile___lockfile_1.1.0.tgz";
      path = fetchurl {
        name = "_yarnpkg_lockfile___lockfile_1.1.0.tgz";
        url  = "https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.1.0.tgz";
        sha1 = "e77a97fbd345b76d83245edcd17d393b1b41fb31";
      };
    }

    {
      name = "docopt___docopt_0.6.2.tgz";
      path = fetchurl {
        name = "docopt___docopt_0.6.2.tgz";
        url  = "https://registry.yarnpkg.com/docopt/-/docopt-0.6.2.tgz";
        sha1 = "b28e9e2220da5ec49f7ea5bb24a47787405eeb11";
      };
    }
  ];
}
