if vim.g.did_load_starter_plugin then
  return
end
vim.g.did_load_starter_plugin = true

require('mini.starter').setup({})
