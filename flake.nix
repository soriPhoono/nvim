{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    snowfall = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = inputs: inputs.snowfall.mkFlake {
    inherit inputs;

    src = ./.;

    snowfall = {
      root = ./nix;

      namespace = "soriphoono.nvim";

      meta = {
        name = "soriphoono.nvim";
        title = "Personal neovim configuration";
      };
    };
  };
}
