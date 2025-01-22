{
  imports = [
    ./core/opts.nix
    ./core/keymaps.nix

    ./plugins/cmp.nix
    ./plugins/dashboard.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/neotree.nix
    ./plugins/noice.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/util.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavor = "macchiato";
      transparent_background = true;
    };
  };
}
