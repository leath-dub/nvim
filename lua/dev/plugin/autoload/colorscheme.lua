return {
  "decaycs/decay.nvim",
  config = function ()
    local ok, decay = pcall(require, "decay")
    if not ok then
      error("Can't require decay ! :v")
    end

    decay.setup {
      style = "default",
    }

    vim.cmd("colorscheme decayce")
  end,
}
