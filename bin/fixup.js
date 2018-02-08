#!/usr/bin/env node

/* Usage:
 * node fixup_bin.js <output_dir> [<bin_pkg_1>, <bin_pkg_2> ... ]
 */

const fs = require('fs');
const path = require('path');

const output = process.argv[2];
const packagesToPublishBin = process.argv.slice(3);
const derivationBinPath = `${output}/bin`;

/* eslint-disable no-console */

function processPackage(name) {
  console.log('Processing ', name);
  const packagePath = `${output}/node_modules/${name}`;
  const packageJsonPath = `${packagePath}/package.json`;
  const packageJson = JSON.parse(fs.readFileSync(packageJsonPath).toString());

  if (!packageJson.bin) {
    console.log('No binaries provided');
    return;
  }

  // There are two alternative syntaxes for `bin`
  // a) just a plain string, in which case the name of the package is the name of the binary.
  // b) an object, where key is the name of the eventual binary, and the value the path to that binary.
  if (typeof packageJson.bin === 'string') {
    const binName = packageJson.bin;
    packageJson.bin = {};
    packageJson.bin[packageJson.name] = binName;
  }

  Object.entries(packageJson.bin).forEach(([binName, binPath]) => {
    const fullBinPath = path.normalize(`${packagePath}/${binPath}`);
    fs.symlinkSync(fullBinPath, `${derivationBinPath}/${binName}`, 'file');
    console.log('Linked', binName);
  });
}

/* eslint-enable no-console */

packagesToPublishBin.forEach(pkg => {
  processPackage(pkg);
});
