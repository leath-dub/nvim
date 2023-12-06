local function default_mini_setup(plg)
  return function ()
    require(plg).setup()
  end
end

return {{
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
  config = default_mini_setup("mini.comment"),
}, {
  "echasnovski/mini.indentscope",
  config = function ()
    require("mini.indentscope").setup({
      symbol = "│"
    })
  end
}, {
  "echasnovski/mini.surround",
  config = function ()
    require("mini.surround").setup({mappings = {
      add = '<c-s>a', -- Add surrounding in Normal and Visual modes
      delete = '<c-s>d', -- Delete surrounding
      find = '<c-s>f', -- Find surrounding (to the right)
      find_left = '<c-s>F', -- Find surrounding (to the left)
      highlight = '<c-s>h', -- Highlight surrounding
      replace = '<c-s>r', -- Replace surrounding
      update_n_lines = '<c-s>n', -- Update `n_lines`

      suffix_last = 'l', -- Suffix to search with "prev" method
      suffix_next = 'n', -- Suffix to search with "next" method
    }})
  end,
}, {
  "echasnovski/mini.files",
  opts = {
    window = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      use_as_default_explorer = true,
    }
  }
}}
