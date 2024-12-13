{
  imports = [
    ./cmp.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
    ./neorg.nix
    ./ui.nix
  ];

  programs.nixvim.plugins = {
    web-devicons.enable = true;
    autoclose.enable = true; # TODO: find replacement
  };
}
