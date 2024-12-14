{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./core/opts.nix
    ./core/keymaps.nix
    
    ./plugins/cmp.nix
    ./plugins/lsp.nix
    ./plugins/neorg.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/ui.nix
    ./plugins/util.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
