-- Clear highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('i', 'jj', '<ESC>')

-- VSCode parity keymaps
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Explorer' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope commands<CR>', { desc = 'Command Palette' })
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })

-- Editor management
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Split Vertical' })
vim.keymap.set('n', '<leader>s', '<cmd>split<CR>', { desc = 'Split Horizontal' })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>l', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>h', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })

-- Terminal
vim.keymap.set('n', '<C-S-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<C-S-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Git Telescope
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = 'Git Status' })
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Git Commits' })
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { desc = 'Git Branches' })

-- Lazygit (via ToggleTerm)
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _lazygit_toggle()
  lazygit:toggle()
end
vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Lazygit"})
