if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

local telescope = require('telescope')
local builtin = require('telescope.builtin')

local keymap = vim.keymap

-- Fall back to find_files if not in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
keymap.set('n', '<leader>ff', project_files, { desc = 'find project files' })
keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'find symbols (lsp)' })

telescope.setup {
  defaults = {
    path_display = {
      'truncate',
    },
    preview = {
      treesitter = true,
    },
    history = {
      path = vim.fn.stdpath('data') .. '/telescope_history.sqlite3',
      limit = 1000,
    },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    vimgrep_arguments = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension('fzy_native')
-- telescope.load_extension('smart_history')
