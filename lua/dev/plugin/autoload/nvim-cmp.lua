return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function ()
    local cmp = require("cmp")
    local snip = require("luasnip")

    snip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function (args)
          snip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert {
        ["<c-n>"] = cmp.mapping(function(_) -- Ctrl-n for opening completion + getting next item
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<c-d>"] = cmp.mapping.scroll_docs(4),
        ["<c-u>"] = cmp.mapping.scroll_docs(-4),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "codeium" },
      },
    }
  end,
}
