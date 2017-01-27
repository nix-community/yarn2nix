#!/usr/bin/env node
"use strict";

const HEAD = `
{fetchurl, nodejs, linkFarm}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
`.trim();

function generateNix(lockedDependencies) {
  let output = HEAD;
  let found = {};

  for (var depRange in lockedDependencies) {
    let dep = lockedDependencies[depRange];

    let name = depRange.split("@")[0];
    let version = dep["version"];
    let file_name = name + "-" + version + ".tgz";

    if (found.hasOwnProperty(file_name)) {
      console.error("HUH! Found " + file_name + " more than once!");
      console.error("Ignoring second declaration..");
      continue;
    } else {
      found[file_name] = null;
    }

    let [url, sha1] = dep["resolved"].split("#");

    output += `
    {
       name = "${file_name}";
       path = fetchurl {
         name = "${file_name}";
         url  = "${url}";
         sha1 = "${sha1}";
       };
    }`
  }
  output += "  ];\n";

  output += "}\n";
  return output;
}

const yarnLock = process.argv[2] || "yarn.lock";
const fs = require("fs");
const YarnfileParser = require("yarn/lib/lockfile/parse.js").default;
const yarn_lock_file_content = fs.readFileSync(yarnLock).toString();

const lockedDependencies  = YarnfileParser(yarn_lock_file_content)
let output = generateNix(lockedDependencies);

console.log(output);
