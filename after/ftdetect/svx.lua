local bufnm = vim.fn.bufname("%")

if string.find(bufnm, ".svx") then
  vim.bo.filetype = "svelte"
  vim.api.nvim_cmd({ cmd = "set", args = { "ft=svelte" } }, {})
end
