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
  config = default_mini_setup("mini.surround"),
}}
