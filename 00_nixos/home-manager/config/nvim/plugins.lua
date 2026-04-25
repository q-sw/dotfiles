-- Lualine
require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
}

-- Neo-tree
require('neo-tree').setup {
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Indent blankline
require('ibl').setup()

-- Toggleterm
require('toggleterm').setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
}
