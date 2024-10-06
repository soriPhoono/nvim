local fn = vim.fn

fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError"})
fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

require('neo-tree').setup({
  close_if_last_window = true,
})
