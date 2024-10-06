vim.bo.comments = ':#'

local py_ls_cmd = 'pylsp'

if vim.fn.executable(py_ls_cmd) ~= 1 then
  return
end

local root_files = {
  '.git',
  'pyproject.toml',
}

vim.lsp.start {
  name = 'pylsp',
  cmd = { py_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
