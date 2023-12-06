return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-telescope/telescope-fzy-native.nvim", lazy = true },
  },
  cmd = "Telescope",
  config = function()
    local ok, telescope = pcall(require, "telescope")
    if not ok then
      return {}
    end
    telescope.setup {
      defaults = {
        layout_config = {
          vertical = { width = .9 },
          horizontal = { width = .9 }
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          hidden = true
        },
        live_grep = {
          theme = "dropdown"
        },
        builtin = {
          theme = "dropdown"
        }
      }
    }
    telescope.load_extension("fzy_native")
    telescope.load_extension("flutter")

    vim.keymap.set("n", "<leader>pf", require('telescope.builtin').find_files, { desc = "Find File" })
    vim.keymap.set("n", "<leader>ps", require('telescope.builtin').live_grep, { desc = "Search file"})
    vim.keymap.set("n", "<leader>pt", require("telescope.builtin").treesitter, { desc = "Search treesitter tokens" })
    vim.keymap.set("n", "<leader>?", require('telescope.builtin').help_tags, { desc = "Telescope help tags"})
    vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Telescope buffers"})
    vim.keymap.set("n", "<leader>r", require("telescope.builtin").builtin, { desc = "Run telescope builtin"})
  end
}
