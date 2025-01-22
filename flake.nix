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
    ...
  }: let
    lib = nixpkgs.lib.extend (
      final: prev:
        import ./lib {inherit (nixpkgs) lib;}
    );
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      checks.pre-commit-hooks = import ./pre-commit-hooks.nix {
        inherit pre-commit-hooks pkgs;
      };

      devShells.default = import ./shell.nix {
        inherit self pkgs;
      };

      packages =
        lib.mapAttrs
        (name: type:
          if type == "directory"
          then import ./nvim/${name}/default.nix
          else if type == "regular"
          then import ./nvim/${name}
          else {message = "Failed to load module ${name}";})
        (lib.filterAttrs
          (name: type: (type == "directory" && builtins.pathExists ./nvim/${name}/default.nix) || type == "regular")
          (builtins.readDir ./nvim));
    });
}
