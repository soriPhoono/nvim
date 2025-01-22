{
  inputs,
  pkgs,
  system,
  ...
}: let
  pre-commit-hooks = import ../../checks/pre-commit-hooks/default.nix {
    inherit inputs system;
  };
in
  pkgs.mkShell {
    inherit (pre-commit-hooks) shellHook;

    packages = with pkgs; [
      nixd
    ];

    buildInputs = pre-commit-hooks.enabledPackages;
  }
