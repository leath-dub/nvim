vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", vim.cmd.bdelete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader><leader>", "<c-6>", { desc = "Alternative file" })
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Yank to end of line into system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste after/below from system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>P", '"+P', { desc = "Paste before/above from system clipboard" })
