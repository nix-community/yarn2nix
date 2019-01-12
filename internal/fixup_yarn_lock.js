#!/usr/bin/env node

/* Usage:
 * node fixup_yarn_lock.js yarn.lock
 */

const fs = require('fs')
const path = require('path')
const readline = require('readline')

const yarnLockPath = process.argv[2]

const readFile = readline.createInterface({
  input: fs.createReadStream(yarnLockPath, { encoding: 'utf8' }),

  // Note: we use the crlfDelay option to recognize all instances of CR LF
  // ('\r\n') in input.txt as a single line break.
  crlfDelay: Infinity,

  terminal: false, // input and output should be treated like a TTY
})

// Url examples:
// https://registry.yarnpkg.com/acorn-es7-plugin/-/acorn-es7-plugin-1.1.7.tgz
// https://registry.npmjs.org/acorn-es7-plugin/-/acorn-es7-plugin-1.1.7.tgz
// git+https://github.com/srghma/node-shell-quote.git
// git+https://1234user:1234pass@git.graphile.com/git/users/1234user/postgraphile-supporter.git
//
// Note:
// this function is duplicated at yarn2nix.js

// TODO: use yarn workspaces to extract this function to lib and reuse in yarn2nix.js
function urlToName(url) {
  if (url.startsWith('git+')) {
    return path.basename(url)
  }
  return url
    .replace('https://registry.yarnpkg.com/', '') // prevents having long directory names
    .replace(/[@/:-]/g, '_') // replace @ and : and - characted with underscore
}

const result = []

readFile
  .on('line', line => {
    const arr = line.match(/^ {2}resolved "([^#]+)#([^"]+)"$/)

    if (arr !== null) {
      const [_, url, shaOrRev] = arr

      const fileName = urlToName(url)

      result.push(`  resolved "${fileName}#${shaOrRev}"`)
    } else {
      result.push(line)
    }
  })
  .on('close', () => {
    fs.writeFile(yarnLockPath, result.join('\n'), 'utf8', err => {
      if (err) {
        console.error(
          'fixup_yarn_lock: fatal error when trying to write to yarn.lock',
          err,
        )
      }
    })
  })
