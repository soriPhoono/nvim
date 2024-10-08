local nil_ls_cmd = 'nixd'

if vim.fn.executable(nil_ls_cmd) ~= 1 then
  return
end

local root_files = {
  'flake.nix',
  '.git'
}

vim.lsp.start {
  name = 'nil_ls',
  cmd = { nil_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    nixd = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}
