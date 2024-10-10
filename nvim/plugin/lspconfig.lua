local lspconfig = require('lspconfig')

lspconfig.bashls.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
}
