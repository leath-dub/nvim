return {
  "ThePrimeagen/harpoon",
  keys = {
    {"<leader>m", function () return require("harpoon.mark").add_file() end},
    {"<leader>h", function () return require("harpoon.ui").toggle_quick_menu() end},
    {"<leader>d", function () return require("harpoon.ui").nav_file(1) end},
    {"<leader>f", function () return require("harpoon.ui").nav_file(2) end},
    {"<leader>j", function () return require("harpoon.ui").nav_file(3) end},
    {"<leader>k", function () return require("harpoon.ui").nav_file(4) end},
  },
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  }
}
