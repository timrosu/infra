{
  inputs,
  lib,
  ...
}: {
  flake-file.inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-26.05";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    flake-file = {
      url = lib.mkDefault "github:denful/flake-file";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
    };
  };

  imports = [
    inputs.flake-file.flakeModules.default
  ];

  flake-file.outputs = "flake-parts";
}
