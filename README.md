# My Dotfiles

Unified repository for all my personal configurations.

## Structure

```
dotfiles/
├── bash/        # Bash configuration (.bashrc, prompt)
├── zsh/        # Zsh configuration (.zshrc)
├── tmux/       # Tmux configuration
├── nixos/      # NixOS configurations
├── ansible/    # Ansible roles for Ubuntu
├── macos/      # macOS bundle and install script
├── vscode/     # VS Code configurations
├── scripts/    # Utility scripts
└── gnome/     # GNOME setup scripts
```

## Tools Configured

- **Bash**: Shell with custom aliases, functions, and completion caching
- **Zsh**: Zsh with Oh-My-Zsh and Powerlevel10k
- **Tmux**: Terminal multiplexer with vim navigation
- **Neovim**: Text editor (via NixOS home-manager)
- **VS Code**: Multi-profile VS Code management
- **NixOS**: Declarative system configurations
- **Ansible**: Ubuntu automation roles

## Installation

### Unix (GNU Stow)

```bash
# Clone
git clone https://github.com/q-sw/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Link configurations
stow bash zsh tmux scripts gnome
```

### NixOS

```bash
# Import in configuration.nix
imports = [ ~/dotfiles/nixos/system/configuration.nix ]
```

### Ansible (Ubuntu)

```bash
cd ansible
ansible-playbook -i inventory main.yaml
```

## VS Code

See [vscode/README.md](./vscode/README.md) for multi-profile setup.

## Scripts

| Script | Description |
|--------|------------|
| `scripts/t` | Attach to tmux session |
| `scripts/gnome_config.sh` | Setup GNOME extensions |
| `scripts/gnome_shortcut_config.sh` | Configure GNOME shortcuts |

## Linting

This repo uses pre-commit hooks:

```bash
pip install pre-commit
pre-commit install
```

## Keyboard Shortcuts

### VS Code (Neovim Mode)

| Shortcut | Action |
|---------|--------|
| `Space Space` | Command palette |
| `Space f f` | Quick open file |
| `Space e` | Toggle sidebar |
| `Space p` | List projects |
| `Space f s` | Toggle fullscreen |
| `Space h` | Previous editor |
| `Space l` | Next editor |
| `Space x` | Close editor |
| `Space v` | Split vertical |
| `Space s` | Split horizontal |
| `Ctrl h/j/k/l` | Navigate panes |
| `Ctrl Shift t` | Toggle terminal |
| `Ctrl Shift m` | Focus terminal |
| `Alt p` | Project Manager (global) |

### Tmux

| Shortcut | Action |
|---------|--------|
| `Ctrl a` | Prefix (leader) |
| `Prefix _` | Split vertical |
| `Prefix -` | Split horizontal |
| `Prefix r` | Reload config |
| `Prefix j/k/l/h` | Resize pane |
| `Prefix v` | Begin selection (copy mode) |
| `Prefix y` | Copy to clipboard |

### GNOME

| Shortcut | Action |
|---------|--------|
| `Super 1-6` | Switch workspace |
| `Super h/l` | Workspace left/right |
| `Super w` | Close window |
| `Super Return` | New Alacritty |
| `Super Space` | Ulauncher |
| `Alt 1-9` | Pin app 1-9 |