# No import-from-derivation

Things that need to happen if IFD is missing:
* Fetch the package.json
* Generate the yarn.nix file
* Set all the file paths so it doesn't import from src

