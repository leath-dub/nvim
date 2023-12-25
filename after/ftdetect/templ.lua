local bufnm = vim.fn.bufname("%")

if string.find(bufnm, ".templ") then
  vim.bo.filetype = "templ"
  vim.api.nvim_cmd({ cmd = "set", args = { "ft=templ" } }, {})
end
