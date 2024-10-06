if vim.g.did_load_neotree_plugin then
  return
end
vim.g.did_load_neotree_plugin = true

local keymap = vim.keymap
local fn = vim.fn

fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })

keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { silent = true, desc = "Open file explorer" })

require('neo-tree').setup({
  close_if_last_window = true,
  open_on_setup = true,
})
