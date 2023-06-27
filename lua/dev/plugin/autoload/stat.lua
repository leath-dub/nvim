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
        ["N"] = { fg = "#1f1f28", bg = "#9d7cd8" },
        ["I"] = { fg = "#1f1f28", bg = "#7aa2f7" },
        ["V"] = { fg = "#1f1f28", bg = "#ff9e64" },
        ["C"] = { fg = "#1f1f28", bg = "#f7768e" },
        ["T"] = { fg = "#1f1f28", bg = "#9ece6a" },
        ["S"] = { fg = "#1f1f28", bg = "#db4b4b" },
        ["File"] = { fg = "#c0caf5", bg = "#24283b" },
        ["Filetype"] = { fg = "#c0caf5", bg = "#24283b" },
        ["GitDiffDeletion"] = { fg = "#b2555b", bg = "#24283b" },
        ["GitDiffInsertion"] = { fg = "#266d6a", bg = "#24283b" }
      }
    }
  end
}
