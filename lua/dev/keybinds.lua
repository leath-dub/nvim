vim.g.mapleader = " "
vim.keymap.set("n", "<leader><leader>", "<c-6>")
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set('n', '<leader>pb', vim.cmd.Lexplore)
