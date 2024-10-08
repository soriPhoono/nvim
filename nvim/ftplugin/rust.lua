local rust_analyzer_cmd = 'rust_analyzer'

if vim.fn.executable(rust_analyzer_cmd) ~= 1 then
  return
end

local root_files = {
  'Cargo.toml',
  '.git'
}

vim.lsp.start {
  name = 'rust_analyzer',
  cmd = { rust_analyzer_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
