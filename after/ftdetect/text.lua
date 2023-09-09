local bufnm = vim.fn.bufname("%")
if string.find(bufnm, "todo.txt") then
  vim.bo.filetype = "todotxt"
  vim.api.nvim_cmd({ cmd = "set", args = { "ft=todotxt" } }, {})
end

if string.match(bufnm, ".*Caddyfile") ~= nil then
  vim.bo.filetype = "Caddyfile"
  vim.api.nvim_cmd({ cmd = "set", args = { "ft=conf" } }, {})
end
