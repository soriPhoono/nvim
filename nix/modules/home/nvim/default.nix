{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./core/opts.nix
    ./core/keymaps.nix

    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/mini.nix
    ./plugins/neorg.nix
    ./plugins/neotree.nix
    ./plugins/noice.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/util.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
