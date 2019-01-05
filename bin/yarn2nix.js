#!/usr/bin/env node

"use strict";

const crypto = require('crypto');
const fs = require("fs");
const https = require("https");
const path = require("path");
const util = require("util");
const execFile = util.promisify(require('child_process').execFile);

const lockfile = require("@yarnpkg/lockfile")
const docopt = require("docopt").docopt;
const equal = require("deep-equal");

////////////////////////////////////////////////////////////////////////////////

const USAGE = `
Usage: yarn2nix [options]

Options:
  -h --help        Shows this help.
  --no-nix         Hide the nix output
  --no-patch       Don't patch the lockfile if hashes are missing
  --lockfile=FILE  Specify path to the lockfile [default: ./yarn.lock].
`

const HEAD = `
{ fetchurl, linkFarm, runCommandNoCC, gnutar }: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
`.trim();

////////////////////////////////////////////////////////////////////////////////

// fetchgit transforms
//
// "shell-quote@git+https://github.com/srghma/node-shell-quote.git#without_unlicenced_jsonify":
//   version "1.6.0"
//   resolved "git+https://github.com/srghma/node-shell-quote.git#1234commit"
//
// to
//
// builtins.fetchGit {
//   url = "https://github.com/srghma/node-shell-quote.git";
//   ref = "without_unlicenced_jsonify";
//   rev = "1234commit";
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
// builtins.fetchGit {
//   url = "https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git";
//   rev = "1234commit";
// }

function fetchgit(file_name, url, rev, branch) {
  return `    {
    name = "${file_name}";
    path =
      let
        repo = builtins.fetchGit {
          url = "${url}";
          ref = "${branch}";
          rev = "${rev}";
        };
      in
        runCommandNoCC "${file_name}" { buildInputs = [gnutar]; } ''
          # Set u+w because tar-fs can't unpack archives with read-only dirs
          # https://github.com/mafintosh/tar-fs/issues/79
          tar cf $out --mode u+w -C \${repo} .
        '';
  }`
}

// Examples:
// https://registry.yarnpkg.com/acorn-es7-plugin/-/acorn-es7-plugin-1.1.7.tgz
// https://registry.npmjs.org/acorn-es7-plugin/-/acorn-es7-plugin-1.1.7.tgz
// git+https://github.com/srghma/node-shell-quote.git
// git+https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git
//
// Note:
// this function is duplicated at fixup_yarn_lock.js
function urlToName(url) {
  // TODO: before - , now - .replace(/\W/g, '_'), this breaks old generated yarn.nix files, is it fine?
  if (url.startsWith('git+')) {
    return path.basename(url)
  } else {
    return url
      .replace("https://registry.yarnpkg.com/", "") // prevents having long directory names
      .replace(/[@/:-]/g, '_'); // replace @ and : and - characted with underscore
  }
}

async function fetchLockedDep(depRange, dep) {
  const depRangeParts = depRange.split('@');

  if (!dep.resolved) return "";

  const [url, sha1_or_rev] = dep["resolved"].split("#");

  const file_name = urlToName(url)

  if (url.startsWith('git+')) {
    const rev = sha1_or_rev

    const [_, branch] = depRange.split('#')

    const url_for_git = url.replace(/^git\+/, "")

    return fetchgit(file_name, url_for_git, rev, branch || "master");
  }
  else {
    const sha = sha1_or_rev

    return `    {
      name = "${file_name}";
      path = fetchurl {
        name = "${file_name}";
        url  = "${url}";
        sha1 = "${sha}";
      };
    }`;
  }
}

function generateNix(lockedDependencies) {
  const depPromises = Object.entries(lockedDependencies).map(([range, dep]) => fetchLockedDep(range, dep));

  Promise.all(depPromises).then((chunks) => {
    console.log(HEAD);
    (new Set(chunks)).forEach((v) => console.log(v));
    console.log("  ];")
    console.log("}")
  });
}


function getSha1(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      const { statusCode } = res;
      const hash = crypto.createHash('sha1');
      if (statusCode !== 200) {
        const err = new Error('Request Failed.\n' +
                          `Status Code: ${statusCode}`);
        // consume response data to free up memory
        res.resume();
        reject(err);
      }

      res.on('data', (chunk) => { hash.update(chunk); });
      res.on('end', () => { resolve(hash.digest('hex')) });
      res.on('error', reject);
    });
  });
};

function updateResolvedSha1(pkg) {
  // local dependency

  if (!pkg.resolved) { return Promise.resolve(); }
  const [url, sha1] = pkg.resolved.split("#", 2)
  if (!sha1) {
    return new Promise((resolve, reject) => {
      getSha1(url).then(sha1 => {
        // TODO: refactor - dont mutate pkg, return object { pkg, resolved }
        pkg.resolved = `${url}#${sha1}`;
        resolve();
      }).catch(reject);
    });
  } else {
    // nothing to do
    return Promise.resolve();
  };
}

function values(obj) {
  const entries = [];
  for (const key in obj) {
    entries.push(obj[key]);
  }
  return entries;
}

////////////////////////////////////////////////////////////////////////////////
// Main
////////////////////////////////////////////////////////////////////////////////

const options = docopt(USAGE);

const data = fs.readFileSync(options['--lockfile'], 'utf8')
const json = lockfile.parse(data)
if (json.type != "success") {
  throw new Error("yarn.lock parse error")
}

// Check for missing hashes in the yarn.lock and patch if necessary
const pkgs = values(json.object);

Promise.all(pkgs.map(updateResolvedSha1)).then(() => {
  const origJson = lockfile.parse(data)

  if (!equal(origJson, json)) {
    console.error("found changes in the lockfile", options["--lockfile"]);

    if (options["--no-patch"]) {
      console.error("...aborting");
      process.exit(1);
    }

    fs.writeFileSync(options['--lockfile'], lockfile.stringify(json.object));
  }

  if (!options['--no-nix']) {
    generateNix(json.object);
  }
}).catch((error) => {
  console.error(error);
  process.exit(1);
});
