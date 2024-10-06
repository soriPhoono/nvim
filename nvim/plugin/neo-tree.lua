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

require('neo-tree').setup({
  close_if_last_window = true,

  filesystem = {
    window = {
      position = 'current',
    }
  }
})
