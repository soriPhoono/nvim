{
  description = "Registry flake for various neovim configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    snowfall-lib,
    nixvim,
    ...
  }:
    snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;
      snowfall.namespace = "neovim";
    }
    // flake-utils.lib.eachDefaultSystemPassThrough (
      system: let
        inherit (nixpkgs) lib;

        pkgs = nixpkgs.legacyPackages.${system};
      in {
        nixvimModules =
          lib.mapAttrs
          (name: type: import ./nvim/${name}/default.nix)
          (lib.filterAttrs
            (name: type: type == "directory" && builtins.pathExists ./nvim/${name}/default.nix)
            (builtins.readDir ./nvim));

        nixvimConfigurations =
          lib.mapAttrs
          (name: type:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;

              module = _: {
                imports =
                  (lib.mapAttrsToList (name: module: module) self.nixvimModules)
                  ++ [
                    ./editors/${name}/default.nix
                  ];
              };
            })
          (lib.filterAttrs
            (name: type: type == "directory" && builtins.pathExists ./editors/${name}/default.nix)
            (builtins.readDir ./editors));
      }
    );
}
