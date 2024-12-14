{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./core
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
