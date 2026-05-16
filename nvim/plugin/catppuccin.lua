if vim.g.did_load_catppuccin_plugin then
  return
end
vim.g.did_load_catppuccin_plugin = true

require('catppuccin').setup {
  flavour = 'macchiato',
  transparent_background = true,
  term_colors = true,
  integrations = {
    treesitter = true,
    telescope = { enabled = true },
    noice = { enabled = true },
    neo_tree = { enabled = true, show_root = true },
    gitsigns = true,
    lualine = { enabled = true },
    which_key = { enabled = true },
    navic = { enabled = true },
    diffview = { enabled = true },
    native_lsp = { enabled = true },
    illuminate = { enabled = true },
    notify = { enabled = true },
    mini = { enabled = true },
  },
}

vim.cmd.colorscheme('catppuccin')
