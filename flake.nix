{
  description = "Registry flake for various neovim configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    pre-commit-hooks,
    nixvim,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      checks.default = pre-commit-hooks.lib.${system}.run {
        src = ./.;

        hooks = {
          gptcommit.enable = true;

          alejandra.enable = true;
          flake-checker.enable = true;
          statix.enable = true;
        };
      };

      devShells.default = pkgs.mkShell {
        inherit (self.checks.${system}.default) shellHook;

        packages = with pkgs; [
          nixd
        ];

        buildInputs = self.checks.${system}.default.enabledPackages;
      };

      packages.hollace = nixvim.legacyPackages.${system}.makeNixvim self.nixvimModules.hollace;
    })
    // flake-utils.lib.eachDefaultSystemPassThrough (system: {
      nixvimModules.hollace = import ./modules/nvim/hollace;
    });
}
