local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local lsp_functions = function(opts)
  opts = opts or {}
  local functions = {}

  -- Loop through lsp functions and append those with no arguments
  local i = 0
  for k, v  in pairs(vim.lsp.buf) do
    i = i + 1
    functions[i] = k
  end

  pickers.new(opts, {
    prompt_title = "lsp functions",
    finder = finders.new_table {
      results = functions
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.lsp.buf[selection[1]]()
      end)
      return true
    end,
  }):find()
end

return lsp_functions
