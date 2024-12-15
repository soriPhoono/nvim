{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    nvim-autopairs.enable = true;
    gitsigns.enable = true;

    which-key = {
      enable = true;
      settings.preset = "helix";
    };
  };
}
