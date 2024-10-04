if vim.g.did_load_catppuccin_plugin then
  return
end
vim.g.did_load_catppuccin_plugin = true

local cmd = vim.cmd

require('catppuccin').setup({
  flavor = "mocha",
  transparent_background = true,
})

cmd.colorscheme "catppuccin"
