# yarn2nix

<img src="https://travis-ci.org/moretea/yarn2nix.svg?branch=master">

Converts `yarn.lock` files into nix expression.

1. Make yarn and yarn2nix available in your shell.
   ```
     cd $GIT_REPO
     nix-env -i yarn2nix -f .
     nix-env -i yarn -f .
   ```
2. Go to your project dir
3. If you have not generated a yarn.lock file before, run
   ```
     yarn install
   ```
4. Create a `yarn.nix` via:

```
  yarn2nix > yarn.nix
```

5. Create a `default.nix` to build your application (see the example below)

## Example `default.nix`

For example, for the [`front-end`](https://github.com/microservices-demo/front-end) of weave's microservice reference application:

```
  with (import <nixpkgs> {});
  with (import /home/maarten/code/nixos/yarn2nix { inherit pkgs; });
  rec {
    weave-front-end = mkYarnPackage {
      name = "weave-front-end";
      src = ./.;
      packageJson = ./package.json;
      yarnLock = ./yarn.lock;
      # NOTE: this is optional and generated dynamically if omitted
      yarnNix = ./yarn.nix;
    };
  }
```

_note: you must modify `/home/maarten/code/nixos/yarn2nix`_

To make this work nicely, I exposed the express server in `server.js` as a binary:

1. Add a `bin` entry to `packages.json` with the value `server.js`
2. Add `#!/usr/bin/env node` at the top of the file
3. `chmod +x server.js`

### Testing the example

1. Run `nix-build` In the `front-end` directory. Copy the result path.
2. Create an isolated environment `cd /tmp; nix-shell --pure -p bash`.
3. `/nix/store/some-path-to-frontend/bin/weave-demo-frontend`

## License

`yarn2nix` is released under the terms of the GPL-3.0 license.
