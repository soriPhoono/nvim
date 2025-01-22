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
    // flake-utils.lib.eachDefaultSystem (
      system: let
        inherit (nixpkgs) lib;
      in {
        packages =
          lib.mapAttrs
          (name: type: nixvim.legacyPackages.${system}.makeNixvim (import ./nvim/${name}/default.nix))
          (lib.filterAttrs
            (name: type: type == "directory" && builtins.pathExists ./nvim/${name}/default.nix)
            (builtins.readDir ./nvim));
      }
    );
}
