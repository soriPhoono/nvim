if vim.g.did_load_keymaps_plugin then
  return
end
vim.g.did_load_keymaps_plugin = true

local api = vim.api
local keymap = vim.keymap

-- Plugin related keybindings
keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { silent = true, desc = 'Open LazyGit menu' })

-- Editor save and quit functions
keymap.set('n', '<leader>w', '<cmd>w<CR>',
  { silent = true, desc = 'Save current buffer' })
keymap.set('n', '<leader>q', '<cmd>q<CR>',
  { silent = true, desc = 'Quit current buffer' })
keymap.set('n', '<leader>Q', '<cmd>qa!<CR>',
  { silent = true, desc = 'Quit current buffer without saving' })

-- Resize vertical splits
local toIntegral = math.ceil
keymap.set('n', '<leader>ww+', function()
  local curWinWidth = api.nvim_win_get_width(0)
  api.nvim_win_set_width(0, toIntegral(curWinWidth * 3 / 2))
end, { silent = true, desc = 'inc window [w]idth' })
keymap.set('n', '<leader>ww-', function()
  local curWinWidth = api.nvim_win_get_width(0)
  api.nvim_win_set_width(0, toIntegral(curWinWidth * 2 / 3))
end, { silent = true, desc = 'dec window [w]idth' })
keymap.set('n', '<leader>wh+', function()
  local curWinHeight = api.nvim_win_get_height(0)
  api.nvim_win_set_height(0, toIntegral(curWinHeight * 3 / 2))
end, { silent = true, desc = 'inc window [h]eight' })
keymap.set('n', '<leader>wh-', function()
  local curWinHeight = api.nvim_win_get_height(0)
  api.nvim_win_set_height(0, toIntegral(curWinHeight * 2 / 3))
end, { silent = true, desc = 'dec window [h]eight' })
