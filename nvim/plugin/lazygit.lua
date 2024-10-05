if vim.g.did_load_lazygit_plugin then
  return
end
vim.g.did_load_lazygit_plugin = true

local keymap = vim.keymap

-- LazyGit keybinds
keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { silent = true, desc = 'Open LazyGit menu' })
