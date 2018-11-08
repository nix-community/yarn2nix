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
{fetchurl, linkFarm, fetchgit, runCommandNoCC, gnutar}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
`.trim();

////////////////////////////////////////////////////////////////////////////////

async function fetchgit(url, sha1) {
  let file_name = path.basename(url);
  let url_for_git = url.replace(/^git\+/, "")
  const {error, stdout, stderr} = await execFile("nix-prefetch-git", [url_for_git, sha1], {});
  const sha256 = JSON.parse(stdout).sha256;
  if (typeof error !== 'undefined' || typeof sha256 === 'undefined') {
    console.error("Could not prefetch git dependency " + url + ", skipping. This will probably go wrong!");
    console.error("error " + error + " sha256 " + sha256);
  }
  else {
    return `
    {
      name = "${file_name}";
      path = let repo = fetchgit {
          name = "${file_name}";
          url = "${url_for_git}";
          rev = "${sha1}";
          sha256 = "${sha256}";
        };
      in runCommandNoCC "${file_name}" {buildInputs = [gnutar];} ''
        # Set u+w because tar-fs can't unpack archives with read-only dirs
        # https://github.com/mafintosh/tar-fs/issues/79
        tar cf $out --mode u+w -C \${repo} .
      '';
    }`
  }
}

async function fetchLockedDep(depRange, dep) {
  let depRangeParts = depRange.split('@');
  if (!dep.resolved) return "";
  let [url, sha1] = dep["resolved"].split("#");
  if (url.match(/^git(\+[a-z0-9+.-]*)?:/)) {
    return fetchgit(url, sha1);
  }
  else {
    let file_name = url.replace("https://registry.yarnpkg.com/", "").replace(/[@/:-]/g, '_');
    return `
    {
      name = "${file_name}";
      path = fetchurl {
        name = "${file_name}";
        url  = "${url}";
        sha1 = "${sha1}";
      };
    }`;
  }
}

function generateNix(lockedDependencies) {
  let depPromises = Object.entries(lockedDependencies).map(([range, dep]) => fetchLockedDep(range, dep));
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
  let [url, sha1] = pkg.resolved.split("#", 2)
  if (!sha1) {
    return new Promise((resolve, reject) => {
      getSha1(url).then(sha1 => {
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
  var entries = [];
  for (let key in obj) {
    entries.push(obj[key]);
  }
  return entries;
}

////////////////////////////////////////////////////////////////////////////////
// Main
////////////////////////////////////////////////////////////////////////////////

var options = docopt(USAGE);

let data = fs.readFileSync(options['--lockfile'], 'utf8')
let json = lockfile.parse(data)
if (json.type != "success") {
  throw new Error("yarn.lock parse error")
}

// Check fore missing hashes in the yarn.lock and patch if necessary
var pkgs = values(json.object);
Promise.all(pkgs.map(updateResolvedSha1)).then(() => {
  let newData = lockfile.stringify(json.object);

  if (newData != data) {
    console.error("found changes in the lockfile", options["--lockfile"]);

    if (options["--no-patch"]) {
      console.error("...aborting");
      process.exit(1);
    }

    fs.writeFileSync(options['--lockfile'], newData);
  }

  if (!options['--no-nix']) {
    generateNix(json.object);
  }
}).catch((error) => {
  console.error(error);
  process.exit(1);
});
