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
    // flake-utils.lib.eachDefaultSystem (system: let
      inherit (nixpkgs) lib;
    in {
      packages = let
        users =
          lib.attrNames
          (lib.filterAttrs
            (name: type: type == "directory" && builtins.pathExists ./editors/${name}/default.nix)
            (builtins.readDir ./editors));
      in
        (
          lib.genAttrs
          users
          (name: nixvim.legacyPackages.${system}.makeNixvim (import ./editors/${name}))
        )
        // (lib.genAttrs
          (map (name: "${name}_workspace") users)
          (name:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              module = _: {
                imports = let
                  username = lib.elemAt (lib.splitString "_" name) 0;
                in [
                  ./editors/${username}/plugins
                  ./editors/${username}
                ];
              };
            }));
    });
}
