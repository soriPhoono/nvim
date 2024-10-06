if vim.g.did_load_plugins_plugin then
  return
end
vim.g.did_load_plugins_plugin = true

-- many plugins annoyingly require a call to a 'setup' function to be loaded,
-- even with default configs

local fn = vim.fn
local keymap = vim.keymap

fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })

keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { silent = true, desc = "Open file explorer" })
keymap.set('n', '<leader>t', '<cmd>Trouble diagnostics<CR>', { silent = true, desc = "Open diagnostics browser" })

require('neo-tree').setup({
  close_if_last_window = true,
})
require('trouble').setup()
require('nvim-surround').setup()
require('mini.starter').setup()
