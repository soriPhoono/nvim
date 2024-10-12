if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

require('gitsigns').setup()
require('toggleterm').setup({
  direction = "float",
})
require('which-key').setup({
  preset = "helix"
})

