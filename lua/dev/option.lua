-- Mu Indentation !
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Netrw file browser
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.opt.signcolumn = "yes"
vim.opt.listchars = {
  trail = '¬',
  tab = '> ',
}

-- Global status line
vim.opt.list = true
vim.opt.laststatus = 3

-- Remove The Skinny !!!
vim.opt.guicursor = ''

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function ()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 70,
      on_macro = false,
    })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function (ev)
    local indent = ({
      lua = 2,
      yaml = 2,
      go = { expandtab = false, tabstop = 4, softtabstop = 4, shiftwidth = 4, callback = function ()
        vim.opt.listchars = { tab = '│ ', trail = '¬' }
      end},
    })[ev.match]
    if indent == nil then
      return -- do nothing, leave default
    end
    if type(indent) == "table" then
      vim.opt.expandtab = indent.expandtab
      vim.opt.tabstop = indent.tabstop
      vim.opt.softtabstop = indent.softtabstop
      vim.opt.shiftwidth = indent.shiftwidth
      if indent.callback ~= nil then indent.callback() end
    else
      vim.opt.tabstop = indent
      vim.opt.softtabstop = indent
      vim.opt.shiftwidth = indent
    end
  end
})
