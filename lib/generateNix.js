// @flow

const indentString = require('indent-string');
const stripIndent = require('strip-indent');
const resolveDependencySource = require('./resolveDependencySource');

/*::
  export type $Dependency = {
    version: string,
    // 'file:' dependencies do not have a 'resolved' key
    resolved?: string,
    dependencies: { [string]: string },
  };

  type $LockedDependencies = { [string]: $Dependency };

  export type $MappedDependency = {
    isLocalPackage: boolean,
    nixExpression: string,
    offlineCacheName: string,
  };
*/

const unique = (dependencies /*: Array<$MappedDependency> */) =>
  dependencies.reduce(
    (prev, next) => ({
      ...prev,
      [next.offlineCacheName]: next.nixExpression
    }),
    {}
  );

module.exports = (
  {
    lockedDependencies,
    resolveRelativeTo
  } /*: {
      lockedDependencies: $LockedDependencies,
      resolveRelativeTo: string,
    }
    */
) /*: Promise<string> */ =>
  Promise.all(
    Object.keys(lockedDependencies).map(key =>
      resolveDependencySource({
        depRange: key,
        dependency: lockedDependencies[key],
        resolveRelativeTo
      })
    )
  )
    // Reduce to an object to ensure that there are no duplicate keys in the
    // final result set.
    .then((mappedDependencies /*: Array<$MappedDependency> */) => ({
      packages: Object.values(
        unique(
          mappedDependencies.filter(dependency => !dependency.isLocalPackage)
        )
      ),
      localPackages: Object.values(
        unique(
          mappedDependencies.filter(dependency => dependency.isLocalPackage)
        )
      )
    }))
    .then(({ packages, localPackages }) =>
      Promise.resolve(
        stripIndent(
          `
            { fetchurl, fetchGit, linkFarm, createTarball }: rec {
              mirror = linkFarm "offline" packages;
              packages = [${'\n'}${indentString(packages.join('\n'), 16)}
              ];
              # This is to accomodate for local file: or link: dependencies.
              # They are treated differently (not added to the link farm).
              localPackages = [${'\n'}${indentString(localPackages.join('\n'), 16)}
              ];
            }
          `
        )
      )
    );
