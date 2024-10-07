if vim.fn.executable('pylsp') ~= 1 then
  return
end

local root_files = {
  'pyproject.toml',
}

vim.lsp.start {
  name = 'pylsp',
  cmd = { 'pylsp' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
