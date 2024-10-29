local lspconfig = require('lspconfig')

lspconfig.nixd.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    nixd = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}

lspconfig.bashls.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
}

lspconfig.lua_ls.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global, etc.
        globals = {
          'vim',
          'describe',
          'it',
          'assert',
          'stub',
        },
        disable = {
          'duplicate-set-field',
        },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      hint = { -- inlay hints (supported in Neovim >= 0.10)
        enable = true,
      },
    },
  },
}

lspconfig.clangd.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
}

lspconfig.rust_analyzer.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
}

lspconfig.ts_ls.setup {
  capabilities = require('user.lsp').make_client_capabilities(),
}
