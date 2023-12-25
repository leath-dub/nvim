return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "simrat39/rust-tools.nvim",
    require("dev.plugin.lsp.completion"),
  },
  config = function()
    -- Mason stuff
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "zls", "ansiblels", "pyright", "jdtls", "kotlin_language_server", "svelte", "emmet_language_server", "tailwindcss", "marksman", "templ" },
    }

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {}
      end,
      require("dev.plugin.lsp.handlers"),
    }

    require("lspconfig").ocamllsp.setup {} -- Special case for ocamllsp

    vim.g.markdown_fenced_languages = { -- for denols
      "ts=typescript"
    }
 
    -- Lsp Keybinds
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = require("dev.plugin.lsp.keybinds")
    })
  end,
}
