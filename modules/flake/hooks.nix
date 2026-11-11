{ inputs, ... }: {
  imports = [
    inputs.git-hooks.flakeModule
  ];

  perSystem =
    {
      config,
      pkgs,
      ...
    }:
    {
      pre-commit = {
        check.enable = false;
        settings.package = pkgs.prek;
        settings.hooks = {
          treefmt = {
            enable = true;
            package = config.treefmt.build.wrapper;
          };
        };
      };
    };
}
