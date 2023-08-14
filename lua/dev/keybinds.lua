vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader><leader>", "<c-6>")
-- vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)

local km = require("util.keymap");

km.set({["<leader><leader>"] = {"<c-6>", "Alternative file"}})
km.set({["<leader>q"] = {vim.cmd.bdelete, "Delete Buffer"}})
