{
  description = "Basic flake for a nix project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

  outputs = inputs @ {snowfall-lib, ...}: let
    lib = snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;
    };
  in
    lib.mkFlake {
      inherit inputs;

      src = ./.;
      snowfall.namespace = "NAME HERE";

      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };

      alias = {
        shells.default = "development";
      };
    };
}
