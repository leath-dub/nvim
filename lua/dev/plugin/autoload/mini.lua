local function default_mini_setup(plg)
  return function()
    require(plg).setup()
  end
end

return { {
  "echasnovski/mini.hipatterns",
  config = function()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end
}, {
  "echasnovski/mini.comment",
  config = default_mini_setup("mini.comment"),
}, {
  "echasnovski/mini.indentscope",
  config = function()
    require("mini.indentscope").setup({
      symbol = "│"
    })
  end
}, {
  "echasnovski/mini.surround",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = '<c-s>a',          -- Add surrounding in Normal and Visual modes
        delete = '<c-s>d',       -- Delete surrounding
        find = '<c-s>f',         -- Find surrounding (to the right)
        find_left = '<c-s>F',    -- Find surrounding (to the left)
        highlight = '<c-s>h',    -- Highlight surrounding
        replace = '<c-s>r',      -- Replace surrounding
        update_n_lines = '<c-s>n', -- Update `n_lines`

        suffix_last = 'l',       -- Suffix to search with "prev" method
        suffix_next = 'n',       -- Suffix to search with "next" method
      }
    })
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
}, {
  "echasnovski/mini.clue",
  config = function()
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },
    })
  end,
}, {
  {
    "echasnovski/mini.starter",
    version = false,
    opts = {},
  },
} }
