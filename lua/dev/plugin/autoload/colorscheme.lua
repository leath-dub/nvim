return {
  "rose-pine/neovim",
  config = function ()
    local ok, rose_pine = pcall(require, "rose-pine")
    if not ok then
      error("Can't require decay ! :v")
    end

    vim.cmd("colorscheme rose-pine-dawn")
  end,
}
