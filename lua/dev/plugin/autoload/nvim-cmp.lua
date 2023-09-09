local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


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

---@diagnostic disable-next-line: missing-fields
    cmp.setup {
      snippet = {
        expand = function (args)
          snip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert {
        ["<c-n>"] = cmp.mapping(function(fallback) -- Ctrl-n for opening completion + getting next item
          if cmp.visible() then
            cmp.select_next_item()
          elseif snip.expand_or_jumpable() then
            snip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
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
