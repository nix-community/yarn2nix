# WORK IN PROGRESS!

## yarn2nix
Yarn is package manager for javascript that is compatible with npm.
It uses, just like Bundler and Cargo, a lock file that ties down the exact versions of dependencies
used during installation.

The nice thing, from a Nix perspective, is that the `yarn.lock` file also contains the URL of the
`.tar.gz` file that makes up the package, *and* a sha1 of the content of that package.

I believe that this should make yarn easy to integrate to nix.


### Usage
`yarn2nix package.json yarn.lock > yarn.nix`

### Status

- [x] Downloading the .tgz files
- [x] Verifying the SHA1's
- [ ] Make sure that the directory structure in `$tmp/.cache/yarn` is correct.
