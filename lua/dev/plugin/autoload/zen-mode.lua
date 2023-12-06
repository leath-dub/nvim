return {
  "folke/zen-mode.nvim",
  ft = "markdown",
  opts = {},
  config = function ()
    local zen_mode = require("zen-mode")
    vim.api.nvim_create_autocmd({"UIEnter"}, {
      pattern = "*",
      callback = zen_mode.open,
    })
  end
}
