return {
  "epwalsh/obsidian.nvim",
  event = "BufReadPre " .. vim.loop.os_homedir() .. "/Documents/Obsidian Vault/**.md",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = "~/Documents/Obsidian Vault",
     completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "current_dir"
    },
    finder = "telescope.nvim",
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })
  end,
}
