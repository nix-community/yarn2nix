// @flow

const path = require('path');
// const { spawn } = require('child_process');
const { parse: parseUrl } = require('url');
const stripIndent = require('strip-indent');
const first = require('./first');

/*:: import type { $MappedDependency, $Dependency } from './generateNix'; */

const selectFetcher = (
  { protocol } /*: {protocol: ?string} */
) /*: ?string */ => {
  switch (protocol) {
    case 'git+ssh:': {
      return 'fetchGit';
    }

    case 'link:':
    case 'file:': {
      return null;
    }

    case 'https:':
    case 'http:':
    default: {
      return 'fetchurl';
    }
  }
};

const parsePath = ({ depRange } /*: { depRange: string } */) /*: string */ => {
  if (depRange.includes('file:')) {
    return depRange.slice(depRange.indexOf('file:') + 'file:'.length);
  }

  if (depRange.includes('link:')) {
    return depRange.slice(depRange.indexOf('link:') + 'link:'.length);
  }

  return depRange;
};

const parseProtocol = (
  { depRange, url } /*: {
    depRange: string,
    url: ?string
  } */
) /*: string */ => {
  if (url) {
    const { protocol } = parseUrl(url);

    if (protocol) {
      return protocol;
    }
  }

  if (depRange.includes('@file:')) {
    return 'file:';
  }

  if (depRange.includes('@link:')) {
    return 'link:';
  }

  throw new Error(`couldn't parse protocol for ${depRange}`);
};

// This is in order to parse scopes correctly:
// https://github.com/yarnpkg/yarn/blob/2d454b552d447a0f79a04e4e451e926e1c0a29e7/src/util/normalize-pattern.js#L17
const parseName = ({ depRange } /*: { depRange: string } */) /*: string */ => {
  if (depRange[0] === '@') {
    const name = first(depRange.slice(1).split('@'));

    if (name) {
      return name;
    }
  } else {
    const name = first(depRange.split('@'));

    if (name) {
      return name;
    }
  }

  throw new Error(`couldn't parse name from depRange ${depRange}`);
};

/*::
  type $ResolvedDependencySource = {
    name: string,
    offlineCacheName: string,
    path?: string,
    protocol?: string,
    rev?: string,
    sha1?: string,
    url?: string,
  };
*/

const resolveDependencySource = (
  {
    depRange,
    name,
    protocol,
    sha1,
    url
  } /*: {
    depRange: string,
    name: string,
    protocol: ?string,
    sha1: ?string,
    url: ?string,
  } */
) /*: Promise<$ResolvedDependencySource> */ => {
  switch (protocol) {
    case 'git+ssh:': {
      if (url && sha1) {
        return Promise.resolve({
          // This is how yarn expects git+ssh dependencies to be named in the
          // offline cache.
          //
          // Any discrepancies here will lead to yarn trying to contact the
          // registry when installing modules.
          //
          // See here for more details:
          // https://github.com/yarnpkg/yarn/blob/2b09caff06151d6055705068c7edbc306fee9f68/src/fetchers/git-fetcher.js#L40-L56
          offlineCacheName: `${path.basename(url)}-${sha1}`,
          name,
          rev: sha1,
          // fetchGit doesn't understand URLs like git+ssh://, while yarn does.
          //
          // Drop the `git+` prefix and it happily fetches using SSH.
          url: url.slice(4)
        });
      }

      break;
    }

    case 'link:':
    case 'file:': {
      return Promise.resolve({
        offlineCacheName: name,
        name,
        path: parsePath({ depRange })
      });
    }

    case 'https:':
    case 'http:':
    default: {
      if (sha1 && url) {
        return Promise.resolve({
          // This is how yarn expects tarball dependencies to be named in the
          // offline cache.
          //
          // Any discrepancies here will lead to yarn trying to contact the
          // registry when installing modules.
          //
          // See here for more details:
          // https://github.com/yarnpkg/yarn/blob/2b09caff06151d6055705068c7edbc306fee9f68/src/fetchers/tarball-fetcher.js#L40-L56
          offlineCacheName: (() => {
            const { pathname } = parseUrl(url);

            if (!pathname) {
              throw new Error(`couldn't parse url: ${url}`);
            }

            const pathParts = pathname.replace(/^\//, '').split(/\//g);

            return pathParts.length >= 2 && pathParts[0][0] === '@'
              ? `${pathParts[0]}-${pathParts[pathParts.length - 1]}`
              : `${pathParts[pathParts.length - 1]}`;
          })(),
          name: path.basename(url),
          sha1,
          url
        });
      }

      break;
    }
  }

  throw new Error(`failed to resolve source for dependency ${depRange}`);
};

const formatSource = (
  {
    fetcher,
    resolvedSource,
    resolveRelativeTo
  } /*: {
      fetcher: ?string,
      resolvedSource: $ResolvedDependencySource,
      resolveRelativeTo: string
    } */
) /*: string */ => {
  const { offlineCacheName, ...rest } = resolvedSource;

  if (fetcher === 'fetchGit') {
    return stripIndent(`
      {
        name = "${offlineCacheName}";
        path = createTarball (${fetcher} {
          ${Object.entries(rest)
            .map(([key, value]) => `${key} = "${String(value)}";`)
            .join('\n          ')}
        });
      }
    `).trim();
  } else if (fetcher === 'fetchurl') {
    return stripIndent(`
      {
        name = "${offlineCacheName}";
        path = ${fetcher} {
          ${Object.entries(rest)
            .map(([key, value]) => `${key} = "${String(value)}";`)
            .join('\n          ')}
        };
      }
    `).trim();
  }

  // `resolveRelativeTo` is necessary so that relative paths can be resolved
  // relative to package.json, rather than the temporary Nix build dir!
  if (resolvedSource.path) {
    return stripIndent(`
      {
        name = "${offlineCacheName}";
        path = "\${${path.resolve(
          path.join(resolveRelativeTo, resolvedSource.path)
        )}}";
        oldPath = "${String(resolvedSource.path)}";
      }
    `).trim();
  }

  throw new Error(`could not resolve path for dependency "${rest.name}"`);
};

module.exports = (
  {
    depRange,
    dependency,
    resolveRelativeTo
  } /*: {
      depRange : string,
      dependency: $Dependency,
      resolveRelativeTo: string,
    } */
) /*: Promise<$MappedDependency> */ => {
  let url;
  let sha1;

  if (dependency.resolved) {
    [url, sha1] = dependency.resolved.split('#');
  }
  const protocol = parseProtocol({ depRange, url });

  const name = parseName({ depRange });

  const fetcher = selectFetcher({ protocol });

  return resolveDependencySource({ url, sha1, name, depRange, protocol }).then(
    resolvedSource => ({
      offlineCacheName: resolvedSource.offlineCacheName,
      isLocalPackage: !fetcher,
      nixExpression: formatSource({
        fetcher,
        resolvedSource,
        resolveRelativeTo
      })
    })
  );
};
