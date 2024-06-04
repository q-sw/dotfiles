# dotfiles
This is my dotfiles

## Included dotfiles
- nvim
- tmux
- zsh
- p10k
- i3
- alacritty

## Requirements
- sudo permissions
- ansible 
- git

### Install Requirements

#### Install Git

```shell
sudo apt update
sudo apt install git -y
```

#### Install Ansible

```shell
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

## Installation on Ubuntu

```shell
cd 00_ubuntu_setup
ansible-playbook setup.yaml -e @variables.yaml --ask-become-pass
```

## Installation on MacOS

```shell
sudo /bin/bash macos_setup.sh
```
# Nvim setup

To finish the nvim setup you should edit the file `nvim ~/.config/nvim/lua/q-sw/packer.lua`.  
> Don't care about errors just press enter

After that in nvim command run commands bellow:  
- :so
- :PackerSync

## Installed plugins

|Plugin Name|Description|
|-----------|-----------|
|packer | nvim plugin manager|
|nvim-telescope | File finder|
|catppuccin | colorscheme|
|nvim-treesitter | Colorize code in function of file type|
|harpoon | harpoon file to access it quickly|
|undotree | change file tracker|
|fugitive | Git integration in nvim|
|vim-tmux-navigator | pane navigation for vim and tmux|
|todo-comment | Create todo list by created comment in project file|
|lsp-zero | Pre-configure LSP puglin|
|neo-tree | File explorer|
|lualine | nvim status line|

## Mason additional setup
### linter
Launch nvim and type `:Mason` then type `4` and install:  
- tflint
- flake8
- trivy

### Formatter
Launch nvim and type `:Mason` then type `5` and install:
- prettier
- stylua
- black
- shfmt

## Shorcuts nvim

|Mode  |Shortcut|Plugin|Description|
|------|--------|------|-----------|
|normal|\<leader\>pv|standard|Show vim file explorer|
|normal|\<leader\>h|standard|split horizontal|
|normal|\<leader\>v|standard|split vertical|
|normal|\<leader\>tt|standard| open terminal|
|normal|zi|standard|open or close  all folds|
|normal|zc|standard|close fold with the same indentation|
|normal|zo|standard|open fold with the same indentation|
|visual|\<leader\>y|standard|Copy in system clipboard|
|insert|jk|standard|eschap|
|visual|J|standard|Move block down|
|visual|K|standard|Move block up|
|normal|\<leader\>ff|Telescope|Show project files|
|normal|\<leader\>b|Telescope|Show all active buffers|
|normal|\<C-e>|Telescope|Show only git files|
|normal|\<leader\>gs|fugitive|Git status|
|normal|\<leader\>td|todo-comment|Display all TODO comment in Telescope|
|normal|\<leader\>n|neo-tree|Show project tree|
|normal|\<learder\>u|undotree|Show file change|
|normal|\<C-h\>|vim-tmux-navigator|Move to left panel|
|normal|\<C-j\>|vim-tmux-navigator|Move to buttom panel
|normal|\<C-k\>|vim-tmux-navigator|Move to top panel|
|normal|\<C-l\>|vim-tmux-navigator|Move to right panel|
|insert|\<C-p\>|nvim-cmp|Select the previous item in the autocomplete proposal|
|insert|\<C-n\>|nvim-cmp|Select the next item in the autocomplete proposal|
|insert|\<C-y\>|nvim-cmp|Validate the item selection|
|insert|\<C-p\>|nvim-cmp|Activate the autocomplete|
|normal|gd|lsp|Go to the expressions (var, func...) defintion|
|normal|K|lsp|Display information about the expression under the cursor|
|normal|\<learder\>vws|lsp|Search all expressions in the current workspace|
|normal|\<learder\>vd|lsp|Display in floating windows the information message for diagnostic|
|normal|[d|lsp|Move to the next diagnostic|
|normal|]d|lsp|Move to the previous diagnostic|
|normal|\<learder\>vrr|lsp|Search all occurrences of the expression under the cursor|
|normal|\<learder\>vrn|lsp|Rename all occurrences of the expression under the cursor|
|insert|\<C-h\>| Get help|

# Setup tmux
To finish the tmux setup you should start a new tmux session `tmux` and press `\<C-a\>I` 
This key combination will install all plugins defined in `$HOME/.tmux.conf`

## Installed plugins

|Plugin Name|Description|
|-----------|-----------|
|tpm | Plugin manager|
|vim-tmux-navigator|pane navigation for vim and tmux|
|tmux-resurrect|Restore tmux environment after system restart.|
|tmux-continuum|Save automaticly tmux sessions and restore it when tmux start|
|tmux-autoreload|auto reload config file|

## Shorcuts tmux
|Shorcut|Plugin|Description|
|-------|------|-----------|
|\<C-a\>|standard|prefix command |
|\<C-a\> c|standard|create new window|
|\<C-a\> w|standard|show active sessions and windows|
|\<C-a\> -|standard|Create horizontal pane|
|\<C-a\> _|standard|Create vertical pane|
|\<C-a\> [|standard|Go in navigation mode|
|\<C-h\>|vim-tmux-navigator|Move to left panel|
|\<C-j\>|vim-tmux-navigator|Move to buttom panel
|\<C-k\>|vim-tmux-navigator|Move to top panel|
|\<C-l\>|vim-tmux-navigator|Move to right panel|
|\<C-a\> s|tmux-resurrect|save tmux env|
|\<C-a\> r|tmux-resurrect|restore last tmux env|

## Copy mode
Go in navigation Mode
|Shortcut|Plugin|Description|
|--------|------|-----------|
|v|tmux-yank|active the selection|
|y|tmux-yank|copy the selection
