# My Dotfiles

This repository contains my personal configurations for various tools.

## Configured Tools

- **Alacritty**: A fast, cross-platform terminal emulator.
- **Bash**: The default Unix shell, with custom aliases and functions.
- **Ghostty**: Another terminal emulator.
- **Neovim**: A powerful and extensible text editor based on Vim.
- **Tmux**: A terminal multiplexer.

## Installation with GNU Stow

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles symbolically.
This allows keeping configuration files organized within this repository
while linking them to the appropriate locations on your system.

### Prerequisites

Make sure you have GNU Stow installed on your system.

```bash
# On Debian/Ubuntu
sudo apt install stow

# On Fedora
sudo dnf install stow

# On macOS with Homebrew
brew install stow
```

### How to Use

1. **Clone this repository** into your home directory (or any other location you prefer,
    but the home directory is recommended for simplicity of relative paths)

    ```bash
    cd ~
    git clone https://github.com/your_username/dotfiles.git
    ```

2. **Navigate to the `dotfiles` directory**

    ```bash
    cd dotfiles
    ```

3. **Use `stow` to link the configurations**:

    To link configurations for all tools:

    ```bash
    stow alacratty bash ghostty neovim tmux
    ```

    If you want to link the configuration for a single tool (e.g., Neovim):

    ```bash
    stow neovim
    ```

    `stow` will create symbolic links from the configuration files in this repository to the

    appropriate locations in your home directory (e.g., `~/.config/nvim` will point to
    `~/dotfiles/neovim/.config/nvim`).

### Uninstallation

To unlink the configurations for a tool:

```bash
stow -D tool_name
```

For example:

```bash
stow -D neovim
```
