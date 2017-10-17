#!/usr/bin/env node
"use strict";

const fs = require("fs");
const lockfile = require('@yarnpkg/lockfile')
const path = require("path");

const HEAD = `
{fetchurl, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
`.trim();

function generateNix(lockedDependencies) {
  let found = {};

  console.log(HEAD)

  for (var depRange in lockedDependencies) {
    let dep = lockedDependencies[depRange];

    let depRangeParts = depRange.split('@');
    let [url, sha1] = dep["resolved"].split("#");
    let file_name = path.basename(url)

    if (found.hasOwnProperty(file_name)) {
      continue;
    } else {
      found[file_name] = null;
    }


    console.log(`
    {
      name = "${file_name}";
      path = fetchurl {
        name = "${file_name}";
        url  = "${url}";
        sha1 = "${sha1}";
      };
    }`)
  }

  console.log("  ];")
  console.log("}")
}

// Main

const yarnLock = process.argv[2] || "yarn.lock";

let file = fs.readFileSync(yarnLock, 'utf8')
let json = lockfile.parse(file)

if (json.type != "success") {
  throw new Error("yarn.lock parse error")
}

generateNix(json.object);
