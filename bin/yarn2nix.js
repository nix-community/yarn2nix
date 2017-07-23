#!/usr/bin/env node
"use strict";

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

const yarnLock = process.argv[2] || "yarn.lock";
const fs = require("fs");
const YarnfileParser = require("yarn/lib/lockfile/parse.js").default;
const yarn_lock_file_content = fs.readFileSync(yarnLock).toString();

const lockedDependencies  = YarnfileParser(yarn_lock_file_content)
generateNix(lockedDependencies);
