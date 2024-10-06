if vim.g.did_load_trouble_plugin then
  return
end
vim.g.did_load_trouble_plugin = true

require('trouble').setup({
  defaults = {
    mappings = {
      n = {
        [ '<leader>t' ] = require('trouble.sources.telescope').open,
      },
    }
  }
})
