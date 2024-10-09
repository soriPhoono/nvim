if vim.g.did_load_keymaps_plugin then
  return
end
vim.g.did_load_keymaps_plugin = true

local api = vim.api
local keymap = vim.keymap

-- Plugin related keybindings
keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { silent = true, desc = 'Open LazyGit menu' })
keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>', { silent = true, desc = 'Open terminal' })

-- Editor save and quit functions
keymap.set('n', '<leader>w', '<cmd>w<CR>',
  { silent = true, desc = 'Save current buffer' })
keymap.set('n', '<leader>q', '<cmd>q<CR>',
  { silent = true, desc = 'Quit current buffer' })
keymap.set('n', '<leader>Q', '<cmd>qa<CR>',
  { silent = true, desc = 'Quit current buffer without saving' })
