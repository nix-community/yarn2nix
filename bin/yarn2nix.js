#!/usr/bin/env node
"use strict";

const HEAD = `
{fetchurl, linkFarm, fetchgit}: rec {
  offline_cache = linkFarm "offline" packages;
  packages = [
`.trim();

function generateNix(lockedDependencies) {
  let found = {};
  let splitOnLastAt = function(text) {
    var index = text.lastIndexOf('@');
    return (index === -1) ? [text] : [text.slice(0, index), text.slice(index + 1)]
  }

  console.log(HEAD)

  for (var depRange in lockedDependencies) {
    let dep = lockedDependencies[depRange];

    let version = dep["version"];
    let resolved_string = dep["resolved"]

    if (found.hasOwnProperty(resolved_string)) {
      console.error("HUH! Found " + resolved_string + " more than once!");
      console.error("Ignoring second declaration..");
      continue;
    } else {
      found[resolved_string] = null;
    }
    
    let [url, sha1] = resolved_string.split("#");
    let split_array = depRange.split("@")

    //The dependency is git because it looks like 'XXXX@git'
    if(split_array.length > 1 && split_array[1].startsWith("git")) {
      let git_repo_name = split_array[0]
      console.log(`
      {
        name = "${git_repo_name}";
        path = fetchgit {
          url  = "${url}";
          rev  = "${sha1}";
        };
      }`)
    } else {
      //names in the yarn.lock can have `@` in them, so split on the last one.
      //Eg @types/lodash@^4.14.61
      let name_version_array = splitOnLastAt(depRange);
      //names with @ or / are rejected, so we need to do some fixing up. (Not sure if this is right.)
      let name = name_version_array[0].replace(/[@]/g, '').replace(/[/]/g, '_');
      let file_name = name + "-" + version + ".tgz";
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
