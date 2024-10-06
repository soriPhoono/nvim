if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

-- many plugins annoyingly require a call to a 'setup' function to be loaded,
-- even with default configs

local keymap = vim.keymap

keymap.set('n', '<leader>t', '<cmd>Trouble diagnostics<CR>', { silent = true, desc = "Open diagnostics browser" })

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    ignore_whitespace = true,
  },
})
require('trouble').setup()
require('nvim-surround').setup()
