
{ fetchurl, fetchGit, linkFarm, createTarball }: rec {
  mirror = linkFarm "offline" packages;
  packages = [
    {
      name = "@yarnpkg-lockfile-1.0.0.tgz";
      path = fetchurl {
        name = "lockfile-1.0.0.tgz";
        sha1 = "33d1dbb659a23b81f87f048762b35a446172add3";
        url = "https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.0.0.tgz";
      };
    }
    {
      name = "docopt-0.6.2.tgz";
      path = fetchurl {
        name = "docopt-0.6.2.tgz";
        sha1 = "b28e9e2220da5ec49f7ea5bb24a47787405eeb11";
        url = "https://registry.yarnpkg.com/docopt/-/docopt-0.6.2.tgz";
      };
    }
    {
      name = "indent-string-3.2.0.tgz";
      path = fetchurl {
        name = "indent-string-3.2.0.tgz";
        sha1 = "4a5fd6d27cc332f37e5419a504dbb837105c9289";
        url = "https://registry.yarnpkg.com/indent-string/-/indent-string-3.2.0.tgz";
      };
    }
    {
      name = "strip-indent-2.0.0.tgz";
      path = fetchurl {
        name = "strip-indent-2.0.0.tgz";
        sha1 = "5ef8db295d01e6ed6cbf7aab96998d7822527b68";
        url = "https://registry.yarnpkg.com/strip-indent/-/strip-indent-2.0.0.tgz";
      };
    }
  ];
  # This is to accomodate for local file: or link: dependencies.
  # They are treated differently (not added to the link farm).
  localPackages = [

  ];
}
          
