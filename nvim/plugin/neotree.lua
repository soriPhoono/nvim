if vim.g.did_load_neotree_plugin then
  return
end
vim.g.did_load_neotree_plugin = true

local keymap = vim.keymap

keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { silent = true, desc = "Open file explorer" })

require('neo-tree').setup({
  close_if_last_window = true,
  open_on_setup = true,

  window = {
    position = "float",
  },
})
