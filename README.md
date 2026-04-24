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