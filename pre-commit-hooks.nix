{
  pre-commit-hooks,
  pkgs ? import <nixpkgs> {},
}:
pre-commit-hooks.lib.${pkgs.system}.run {
  src = ./.;

  hooks = {
    gptcommit.enable = true;

    alejandra.enable = true;
    flake-checker.enable = true;
    statix.enable = true;
  };
}
