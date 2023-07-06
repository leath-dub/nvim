return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "simrat39/rust-tools.nvim",
  },
  config = function()
    -- Mason stuff
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "zls", "ansiblels", "pyright", "jdtls", "denols" }
    }
    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup {}
      end,
      require("dev.plugin.lsp.handlers"),
    }

    -- Lsp Keybinds
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = require("dev.plugin.lsp.keybinds")
    })
  end,
}
