if vim.g.did_load_noice_plugin then
  return
end
vim.g.did_load_noice_plugin = true

require('noice').setup({
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = 'rounded',
  },
  cmdline = {
    enabled = true,
    view = 'cmdline_popup',
  },
})
