vim.g.mapleader = " "

--- Show vim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Escape
vim.keymap.set("i", "jk", "<ESC>")

--- Move up and down bloc of line select in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- copy in system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

--- split text zone
vim.keymap.set("n", "<leader>h", vim.cmd.split)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)

--- terminal in vim

vim.keymap.set("n", "<leader>tt", vim.cmd.terminal)
