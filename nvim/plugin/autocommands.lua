if vim.g.did_load_autocommands_plugin then
  return
end
vim.g.did_load_autocommands_plugin = true

local api = vim.api
local keymap = vim.keymap

-- Disable spell checking in terminal buffers
local nospell_group = api.nvim_create_augroup('nospell', { clear = true })
api.nvim_create_autocmd('TermOpen', {
  group = nospell_group,
  callback = function()
    vim.wo[0].spell = false
  end,
})

-- LSP
local lsp_group = api.nvim_create_augroup('UserLsp Config', {})
api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    vim.bo[bufnr].bufhidden = 'hide'

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local function desc(description)
      return { noremap = true, silent = true, buffer = bufnr, desc = description }
    end
    keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, desc('lsp [g]o to [D]eclaration'))
    keymap.set('n', '<leader>ld', vim.lsp.buf.definition, desc('lsp [g]o to [d]efinition'))
    keymap.set('n', '<leader>lh', vim.lsp.buf.hover, desc('[lsp] hover'))
    keymap.set('n', '<F2>', vim.lsp.buf.rename, desc('lsp [r]e[n]ame'))
    keymap.set('n', '<leader>lr', vim.lsp.buf.references, desc('lsp [g]et [r]eferences'))
    keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end, desc('[lsp] [f]ormat buffer'))

    -- Auto-refresh code lenses
    if not client then
      return
    end
    local group = api.nvim_create_augroup(string.format('lsp-%s-%s', bufnr, client.id), {})
    if client.server_capabilities.codeLensProvider then
      vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'TextChanged' }, {
        group = group,
        callback = function()
          vim.lsp.codelens.refresh { bufnr = bufnr }
        end,
        buffer = bufnr,
      })
      vim.lsp.codelens.refresh { bufnr = bufnr }
    end
  end,
})
