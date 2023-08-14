return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function ()
    local wk = require("which-key")
    local km = require("util.keymap");
    wk.register(km.binds)
  end,
  opts = {},
}
