local M = {}

M.binds = {}

function M.set(mappings, opts)
  table.insert(M.binds, {mappings, opts})
end

return M
