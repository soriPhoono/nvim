{flavor ? "macchiato", ...}: {
  colorschemes.catppuccin = {
    enable = true;

    settings = {
      inherit flavor;
    };
  };
}
