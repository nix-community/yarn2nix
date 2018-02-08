// @flow

const fs = require('fs');
const lockfile = require('@yarnpkg/lockfile');
const { docopt } = require('docopt');
const updateResolvedSha1 = require('./updateResolvedSha1');
const generateNix = require('./generateNix');

const options = docopt(`
Usage: yarn2nix [options]

Options:
  -h --help                   Shows this help.
  --no-nix                    Hide the nix output
  --no-patch                  Don't patch the lockfile if hashes are missing
  --lockfile=FILE             Specify path to the lockfile
                                [default: ./yarn.lock].
  --resolve-relative-to=PATH  Directory to which relative paths are resolved.
                                [default: ./]
`);

const data = fs.readFileSync(options['--lockfile'], 'utf8');

const json = lockfile.parse(data);

if (json.type !== 'success') {
  throw new Error('yarn.lock parse error');
}

// Check for missing hashes in the yarn.lock and patch if necessary
const pkgs = Object.values(json.object);

/* eslint-disable no-console */

// Can't cast mixed to $Dependency.
// $FlowFixMe
Promise.all(pkgs.map(updateResolvedSha1)).then(() => {
  const newData = lockfile.stringify(json.object);

  if (newData !== data) {
    console.error('found changes in the lockfile', options['--lockfile']);

    if (options['--no-patch']) {
      console.error('...aborting');
      process.exit(1);
    }

    fs.writeFileSync(options['--lockfile'], newData);
  }

  if (!options['--no-nix']) {
    generateNix({
      lockedDependencies: json.object,
      resolveRelativeTo: options['--resolve-relative-to'] || process.cwd()
    }).then(nixExpression => console.log(nixExpression));
  }
});

/* eslint-enable no-console */
