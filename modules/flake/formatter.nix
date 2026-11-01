{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = _: {
    treefmt = {
      projectRoot = self;

      # the nix way
      programs = {
        # nix
        deadnix = {
          enable = true;
          priority = 1;
        };
        statix = {
          enable = true;
          priority = 2;
        };
        alejandra = {
          enable = true;
          settings.indentation = "TwoSpaces";
          priority = 3;
        };

        # dockerfile
        dockerfmt = {
          enable = true;
          includes = [
            "*/Dockerfile"
            "*/Containerfile"
          ];
          priority = 1;
        };

        # yaml
        yamlfmt = {
          enable = true;
          settings.formatter = {
            type = "basic";
            line_ending = "lf";
            indent = 2;
            indentless_arrays = true;
            trim_trailing_whitespace = true;
            force_quote_style = "single";
            force_array_style = "block";
            retain_line_breaks = true;
          };
          priority = 2;
        };

        # other
        prettier = {
          enable = true;
          settings.tabWidth = 2;
          settings.embeddedLanguageFormatting = "auto";
          excludes = ["*.yaml" "*.yml"];
          priority = 1;
        };
      };

      # mapping to treefmt.toml
      settings = {
        excludes = [
          "LICENSE"
          "test/*"
          "*.svg"
          "*.tape"
          "*.lock"
          "*.env"
          "*.envrc*"
          "*.gitignore"
          ".pre-commit-config.yaml"
        ];
      };
    };
  };
}
