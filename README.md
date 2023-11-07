# dotfiles
This is my dotfiles

## Included dotfiles
- nvim
- tmux
- zsh
- p10k

## Requirements
- sudo permissions
- ripgrep
- 

## Installation on Ubuntu
```shell
sudo /bin/bash macos_setup.sh
```

## Installation on MacOS
```shell
sudo /bin/bash macos_setup.sh
```

# Shorcut nvim

<!--TODO: comprendre les shorcut LSP -->

|Mode  |Shortcut|Plugin|Description|
|------|--------|------|-----------|
|normal|\<leader\>pv|standard|Show vim file explorer|
|normal|\<leader\>h|standard|split horizontal|
|normal|\<leader\>v|standard|split vertical|
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
|normal|\<learde\r>u|undotree|Show file change|
|normal|\<C-h\>|vim-tmux-navigator|Move to left panel|
|normal|\<C-j\>|vim-tmux-navigator|Move to buttom panel
|normal|\<C-k\>|vim-tmux-navigator|Move to top panel|
|normal|\<C-l\>|vim-tmux-navigator|Move to right panel|

# Shorcut tmux
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
