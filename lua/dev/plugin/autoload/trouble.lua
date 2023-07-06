return {
  "folke/trouble.nvim",
  lazy = true,
  keys = {
    {"<leader>t", vim.cmd.TroubleToggle},
  },
  cmd = {
    "Trouble",
    "TroubleClose",
    "TroubleToggle",
    "TroubleRefresh",
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
}
