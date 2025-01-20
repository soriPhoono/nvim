{
  inputs,
  pkgs,
  ...
}:
inputs.nixvim.lib.${pkgs.system}.check.mkTestDerivationFromNixvimModule {
  inherit pkgs;

  extraSpecialArgs = {};

  module = import ../../modules/home/nvim/default.nix;
}
