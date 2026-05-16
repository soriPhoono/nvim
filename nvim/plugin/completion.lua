if vim.g.did_load_completion_plugin then
  return
end
vim.g.did_load_completion_plugin = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('blink-cmp').setup({
  keymap = {
    preset = 'default',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true },
    ghost_text = { enabled = true },
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
