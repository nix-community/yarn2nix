const R = require('ramda')

const urlToName = require('./urlToName')

// fetchgit transforms
//
// "shell-quote@git+https://github.com/srghma/node-shell-quote.git#without_unlicenced_jsonify":
//   version "1.6.0"
//   resolved "git+https://github.com/srghma/node-shell-quote.git#1234commit"
//
// to
//
// {
//   name = "node-shell-quote.git";
//   source = {
//     type = "git";
//     url = "https://github.com/srghma/node-shell-quote.git";
//     ref = "without_unlicenced_jsonify";
//     rev = "1234commit";
//   };
// }
//
// and transforms
//
// "@graphile/plugin-supporter@git+https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git":
//   version "0.6.0"
//   resolved "git+https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git#1234commit"
//
// to
//
// {
//   name = "postgraphile-supporter.git";
//   source = {
//     type = "git";
//     url = "https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git";
//     ref = "master";
//     rev = "1234commit";
//   };
// }

function fetchgit(fileName, url, rev, branch) {
  return `  {
    name = "${fileName}";
    source = {
      type = "git";
      url = "${url}";
      ref = "${branch}";
      rev = "${rev}";
    };
  }`
}

function fetchurl(fileName, url, sha) {
  return `  {
    name = "${fileName}";
    source = {
      type = "url";
      url = "${url}";
      sha1 = "${sha}";
    };
  }`
}

function fetchLockedDep(pkg) {
  const { nameWithVersion, resolved } = pkg

  if (!resolved) {
    console.error(
      `yarn2nix: can't find "resolved" field for package ${nameWithVersion}, you probably required it using "file:...", this feature is not supported, ignoring`,
    )
    return ''
  }

  const [url, sha1OrRev] = resolved.split('#')

  const fileName = urlToName(url)

  if (url.startsWith('git+')) {
    const rev = sha1OrRev

    const [_, branch] = nameWithVersion.split('#')

    const urlForGit = url.replace(/^git\+/, '')

    return fetchgit(fileName, urlForGit, rev, branch || 'master')
  }

  return fetchurl(fileName, url, sha1OrRev)
}

// Object -> String
function generateNix(pkgs) {
  const nameWithVersionAndPackageNix = R.map(fetchLockedDep, pkgs)

  const packagesDefinition = R.join(
    '\n',
    R.values(nameWithVersionAndPackageNix),
  )

  return R.join('\n', ['[', packagesDefinition, ']'])
}

module.exports = generateNix
