if vim.fn.executable('taplo') ~= 1 then
  return
end

local root_files = {
  '*.toml'
}

vim.lsp.start {
  name = 'taplo',
  cmd = { 'taplo lsp stdio' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
