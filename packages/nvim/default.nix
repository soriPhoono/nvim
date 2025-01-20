{
  inputs,
  pkgs,
  ...
}:
inputs.nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
  inherit pkgs;

  extraSpecialArgs = {};

  module = import ../../modules/home/nvim/default.nix;
}
