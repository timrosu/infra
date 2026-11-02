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
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-file = {
      url = lib.mkDefault "github:denful/flake-file";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    inputs.flake-file.flakeModules.default
  ];

  flake-file.outputs = "flake-parts";
}
