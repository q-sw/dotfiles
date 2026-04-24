-- Set cursor shape to default terminal cursor
vim.opt.guicursor = ""

-- Enable line numbers
vim.opt.nu = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable smart auto-indenting
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disable swap and backup files for a cleaner experience
vim.opt.swapfile = false
vim.opt.backup = false

-- Set the directory for persistent undo files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enable persistent undo
vim.opt.undofile = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable true color support in the terminal
vim.opt.termguicolors = true

-- Keep 8 lines of context above and below the cursor when scrolling
vim.opt.scrolloff = 8

-- Always show the sign column to prevent text shifting
vim.opt.signcolumn = "yes"

-- Add '@' and '-' to the list of characters considered part of a filename
vim.opt.isfname:append("@-@")

-- Time in milliseconds to wait for cursor hold events (e.g., for LSP)
vim.opt.updatetime = 50

-- Display a vertical line at column 80 to guide line length
vim.opt.colorcolumn = "80"
