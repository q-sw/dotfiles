--- Set leader
vim.g.mapleader = " "

--- Show vim file explorer
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

--- Escape
vim.keymap.set("i", "jj", "<ESC>")

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


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

---fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gc", '<cmd>Git commit<CR>');

--- NeoTree
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree)

---Todo-comments
vim.keymap.set("n", "<leader>td", vim.cmd.TodoTelescope)
