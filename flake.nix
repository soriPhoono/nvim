{
  description = "Basic flake for a nix project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";

    nixvim = {
      url = "github:nix-community/nixvim";

      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    pre-commit-hooks,
    nixvim,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      formatter = pkgs.alejandra;

      checks.pre-commit-checks = pre-commit-hooks.lib.${system}.run {
        src = ./.;

        hooks = {
          gptcommit.enable = true;

          alejandra.enable = true;
          flake-checker.enable = true;
          statix.enable = true;
        };
      };

      devShells.default = let
        inherit (self.checks.${system}) pre-commit-checks;
      in
        pkgs.mkShell {
          inherit (pre-commit-checks) shellHook;

          packages = with pkgs; [
            nixd
          ];

          buildInputs = pre-commit-checks.enabledPackages;
        };

      packages = {
        hollace = nixvim.legacyPackages.${system}.makeNixvim (import ./nvim/hollace);
      };
    });
}
