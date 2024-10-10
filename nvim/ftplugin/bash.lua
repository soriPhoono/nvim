local bash_ls_cmd = 'bash-language-server'

if vim.fn.executable(bash_ls_cmd) ~= 1 then
  return
end

local root_files = {
  '.git'
}

vim.lsp.start {
  name = 'bashls',
  cmd = { bash_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {}
}
