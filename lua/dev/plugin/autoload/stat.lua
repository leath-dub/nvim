return {
  "leath-dub/stat.nvim",
  event = "Colorscheme",
  config = function()
    local ok, stat = pcall(require, "stat")
    if not ok then
      return {}
    end
    local ___ = Stat.___
    stat.setup {
      winbar = {
        ___,
        Stat.mod.file()
      },
      statusline = {
        ___,
        Stat.mod.mode,
        Stat.mod.filetype,
        Stat.mod.git_diff
      },
      theme = {
        ["N"] = { fg = "#232136", bg = "#c4a7e7" },
        ["I"] = { fg = "#232136", bg = "#3e8fb0" },
        ["V"] = { fg = "#232136", bg = "#f6c177" },
        ["C"] = { fg = "#232136", bg = "#eb6f92" },
        ["T"] = { fg = "#232136", bg = "#56949f" },
        ["S"] = { fg = "#232136", bg = "#b4637a" },
        ["File"] = { fg = "#e0def4", bg = "#2a273f" },
        ["Filetype"] = { fg = "#e0def4", bg = "#2a273f" },
        ["GitDiffDeletion"] = { fg = "#b4637a", bg = "#2a273f" },
        ["GitDiffInsertion"] = { fg = "#56949f", bg = "#2a273f" }
      }
    }
  end
}
