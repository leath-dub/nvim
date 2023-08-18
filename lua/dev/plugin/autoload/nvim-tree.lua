return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local setup = false
    vim.api.nvim_create_autocmd("VimEnter", { callback = function (data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1
      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)

      if not setup then
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup()
      end

      -- open the tree
      require("nvim-tree.api").tree.open()
    end })
  end,
}
