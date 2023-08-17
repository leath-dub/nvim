local bufnm = vim.fn.bufname("%")
if string.find(bufnm, "todo.txt") then
  vim.bo.filetype = "todotxt"
  vim.api.nvim_cmd({ cmd = "set", args = { "ft=todotxt" } }, {})
end
