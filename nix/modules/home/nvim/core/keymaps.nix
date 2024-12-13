{
  programs.nixvim.keymaps =
    builtins.map
      (v: v // { options.silent = true; })
      [
        {
          action = "<cmd>w<CR>";
          key = "<C-s>";
          options.desc = "Close current file or editor";
        }
        {
          action = "<cmd>qall<CR>";
          key = "<C-q>";
          options.desc = "Close the editor";
        }

        {
          action = "<cmd>lua vim.lsp.buf.format()<CR>";
          key = "<leader>lf";
          options.desc = "Format the current buffer";
        }
        {
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          key = "<leader>lh";
          options.desc = "Hover on token";
        }
      ];
}
