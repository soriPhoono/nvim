if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

require('gitsigns').setup()
require('nvim-surround').setup()
require('toggleterm').setup({
  direction = "float",
})
