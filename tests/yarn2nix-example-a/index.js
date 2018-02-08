const { name } = require('./package.json');
const { capitalize } = require('lodash');
const yarn2nixExampleB =require ('yarn2nix-example-b');

module.exports = () => [
  capitalize(`this is ${name}`),
  yarn2nixExampleB()
].join('\n');
