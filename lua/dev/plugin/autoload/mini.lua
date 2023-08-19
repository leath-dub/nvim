return {{
  "echasnovski/mini.cursorword",
  config = function ()
    vim.api.nvim_set_hl(0, "MiniCursorword", { link = "Visual" })
    require("mini.cursorword").setup({ delay = 500 })
  end
}, {
  "echasnovski/mini.animate",
  config = function ()
    require("mini.animate").setup({
      cursor = {
        enable = false,
      }
    })
  end
}, {
  "echasnovski/mini.hipatterns",
  config = function ()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end
}, {
  "echasnovski/mini.comment",
  config = function ()
    require("mini.comment").setup()
  end
}, {
  "echasnovski/mini.indentscope",
  config = function ()
    require("mini.indentscope").setup({
      symbol = "│"
    })
  end
}, {
  "echasnovski/mini.map",
  keys = {
    {"<c-l>", function () return MiniMap.toggle() end},
  },
  config = function ()
    require("mini.map").setup()
  end
}}
