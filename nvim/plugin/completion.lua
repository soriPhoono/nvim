if vim.g.did_load_completion_plugin then
  return
end
vim.g.did_load_completion_plugin = true

local cmp = require('cmp')
local lspkind = require('lspkind')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local function has_words_before()
  local unpack_ = unpack or table.unpack
  local line, col = unpack_(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol',
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      menu = {
        nvim_lsp = '[LSP]',
        nvim_lsp_document_symbol = '[LSP]',
        nvim_lua = '[API]',
        path = '[PATH]',
      },
    },
  },
  mapping = {
    ['<C-j>'] = cmp.mapping(function(_)
      if cmp.visible() then
        cmp.scroll_docs(-4)
      end
    end, { 'i', 'c', 's' }),
    ['<C-k>'] = cmp.mapping(function(_)
      if cmp.visible() then
        cmp.scroll_docs(4)
      end
    end, { 'i', 'c', 's' }),
    ['<Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      end
    end, { 'i', 'c', 's' }),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { 'i', 'c', 's' }),
    -- toggle completion
    ['<C-e>'] = cmp.mapping(function(_)
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end, { 'i', 'c', 's' }),
    ['<CR>'] = cmp.mapping.confirm {
      select = true,
    },
  },
  sources = cmp.config.sources {
    -- The insertion order influences the priority of the sources
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'path' },
  },
  enabled = function()
    return vim.bo[0].buftype ~= 'prompt'
  end,
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

cmp.setup.filetype('lua', {
  sources = cmp.config.sources {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'path' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'path' },
    { name = 'cmdline', },
  },
})
