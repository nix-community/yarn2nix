// @flow

const getSha1 = require('./getSha1');

/*:: import type { $Dependency } from './generateNix'; */

module.exports = (pkg /*: $Dependency */) /*: Promise<$Dependency> */ => {
  // local dependency, nothing to do.
  if (!pkg.resolved) {
    return Promise.resolve(pkg);
  }

  const [url, sha1] = pkg.resolved.split('#', 2);

  if (!sha1) {
    return getSha1(url).then(resolvedSha1 =>
      Object.assign({}, pkg, { resolved: `${url}#${resolvedSha1}` })
    );
  }

  // nothing to do
  return Promise.resolve(pkg);
};
