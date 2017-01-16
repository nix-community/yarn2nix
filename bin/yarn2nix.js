#!/usr/bin/env node
"use strict";

function generateNix(lockedDependencies) {
  let output = "{fetchurl, nodejs, linkFarm}: rec {\n";
  output += '  offline_cache = linkFarm "offline" packages;\n';
  output += "  packages = [\n";

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

    let url = dep["resolved"];
    let sha1 = url.split("#")[1];

    output += '    {\n';
    output += '      name = "' + file_name + '";\n'
    output += '      path = fetchurl {\n';
    output += '        name = "' + file_name + '";\n';
    output += '        url  = "' + url + '";\n';
    output += '        sha1 = "' + sha1 + '";\n';
    output += '      };\n';
    output += '    }\n\n';
  }
  output += "  ];\n";

  output += "}\n";
  return output;
}

const fs = require("fs");
const YarnfileParser = require("yarn/lib/lockfile/parse.js").default;
const yarn_lock_file_content = fs.readFileSync("yarn.lock").toString();

const lockedDependencies  = YarnfileParser(yarn_lock_file_content)
let output = generateNix(lockedDependencies);

console.log(output);
