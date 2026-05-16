---@mod user.lsp
---
---@brief [[
---LSP related functions
---@brief ]]

local M = {}

---Gets a 'ClientCapabilities' object, describing the LSP client capabilities
---Extends the object with capabilities provided by plugins.
---@return lsp.ClientCapabilities
function M.make_client_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Add blink-cmp LSP capabilities
  local blink_capabilities = require('blink-cmp').get_lsp_capabilities(capabilities)
  return blink_capabilities
end

return M
