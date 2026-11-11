# My Nix infrastructure

## Useful commands

I use just for defining and chaining together certain commands. Check `justfile` for more info.

### Generate flake.nix

```sh
just write-flake
```

This exists, so I can have fully self-sufficient modules that also define their own inputs.
These inputs then get copied over to the main flake file and lock file gets generated.

## Plan

- [x] auto-generating flake.nix
- [ ] lock flattening/auto input follow
- [ ] flake modules
- [ ] auto-loading of modules
- [ ] NixOS Facter
- [ ] manage home env (home-manager)
