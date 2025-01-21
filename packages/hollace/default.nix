{
  inputs,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvim (import ../../modules/nvim/hollace)
