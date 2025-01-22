{
  self,
  pkgs ? import <nixpkgs> {},
}:
pkgs.mkShell {
  inherit (self.checks.${pkgs.system}.pre-commit-hooks) shellHook;

  packages = with pkgs; [
    nixd
  ];

  buildInputs = self.checks.${pkgs.system}.pre-commit-hooks.enabledPackages;
}
