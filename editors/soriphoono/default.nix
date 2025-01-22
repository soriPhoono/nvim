{
  imports = [
    ./keymaps.nix
    ./opts.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavor = "macchiato";
      transparent_background = true;
    };
  };
}
