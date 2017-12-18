#!/usr/bin/env node
"use strict";

const fs = require("fs");
const lockfile = require('@yarnpkg/lockfile')
const path = require("path");
const cp = require("child_process");

const remoteToString = function(remote) {
  return `
    {
      name = "${remote.file_name}";
      path = fetchurl {
        name = "${remote.file_name}";
        url  = "${remote.url}";
        sha1 = "${remote.sha1}";
      };
    }`;
}

const localToString = function(local) {
  return `
    {
      name = "${local.file_name}";
      path = ${local.file_name};
    }`;
}

const arrayToString = function(elements) {
  return `[
    ${elements.join("\n")}
  ]`;
}

const astToString = function(ast) {
  const remotes = ast.links
    .filter(function(link) { return link.hasOwnProperty('remote'); })
    .map(function(link) { return remoteToString(link.remote); });

  const locals = ast.links
    .filter(function(link) { return link.hasOwnProperty('local'); })
    .map(function(link) { return localToString(link.local); });

  return `
  {fetchurl, linkFarm}: rec {
    offline_cache = linkFarm "offline" packages;
    packages = ${arrayToString(remotes)};
    localPackages = ${arrayToString(locals)};
  }`;
};

function yarnToAst(lockedDependencies) {
  let found = {};

  return {
    links: Object.keys(lockedDependencies).map(function(depRange) {
      let dep = lockedDependencies[depRange];

      let depRangeParts = depRange.split('@');
      if ('resolved' in dep) {
        let url;
        let sha1;
        let file_name;
        if (/codeload.github.com.*tar.gz\//.test(dep["resolved"])) {
          url = dep["resolved"];
          sha1 = cp.execSync("curl -sS " + url + " | shasum | cut -d \" \" -f 1").toString().trim();
          var matches = /tar.gz\/(.*)/.exec(url);
          file_name = matches[1];
        } else {
          url = dep["resolved"].split("#")[0];
          sha1 = dep["resolved"].split("#")[1];
          file_name = path.basename(url);
        }

        if (found.hasOwnProperty(file_name)) {
          return {};
        } else {
          found[file_name] = null;
        }

        return {
          remote: {
            file_name: file_name,
            url: url,
            sha1: sha1
          }
        };
      } else {
        return {
          local: {
            file_name: depRange.split("@")[1]
          }
        };
      }
    })
  };
}

// Main

const yarnLock = process.argv[2] || "yarn.lock";

let file = fs.readFileSync(yarnLock, 'utf8')
let json = lockfile.parse(file)

if (json.type != "success") {
  throw new Error("yarn.lock parse error")
}

console.log(astToString(yarnToAst(json.object)));
