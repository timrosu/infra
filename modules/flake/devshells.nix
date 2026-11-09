_: {
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells = {
      dev = pkgs.mkShell {
        inputsFrom = [
          config.pre-commit.devShell
          config.treefmt.build.wrapper
        ];
        packages = with pkgs; [
          config.treefmt.build.wrapper
          pkgs.just
          pkgs.flake-edit
        ];
      };

      ci = pkgs.mkShell {
        inputsFrom = [
          config.treefmt.build.wrapper
        ];
      };

      default = config.devShells.dev;
    };
  };
}
