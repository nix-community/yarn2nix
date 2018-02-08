// @flow

const crypto = require('crypto');
const https = require('https');
const stripIndent = require('strip-indent');

module.exports = (url /*: string */) /*: Promise<string> */ =>
  new Promise((resolve, reject) =>
    https.get(url, res => {
      const { statusCode } = res;
      const hash = crypto.createHash('sha1');
      if (statusCode !== 200) {
        const err = new Error(
          stripIndent(`
           Request Failed.

           Status Code: ${statusCode}
         `)
        );
        // consume response data to free up memory
        res.resume();
        reject(err);
      }

      res.on('data', chunk => {
        hash.update(chunk);
      });
      res.on('end', () => {
        resolve(hash.digest('hex'));
      });
      res.on('error', reject);
    })
  );
