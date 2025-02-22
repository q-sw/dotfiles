#!/bin/bash

set -e
set -x

# Install homebrew
function install_homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Finalize homebrew installation
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ${HOME}/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Install package with brewfile
function install_packages(){
    brew bundle install --file=./dundle
}

# Install Oh my ZSH - Powerlevel10k
function install_zsh_style(){
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
}
# Configure Neovim
function setup_neovim() {
    # Clean up previous config
    rm -rf ${HOME}/.config/nvim

    rm -rf  ${HOME}/.local/share/nvim
    rm -rf ${HOME}/.local/state/nvim
    rm -rf ${HOME}/.cache/nvim

    # Install plugin manager
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim
}

#Configure Tmux
function setup_tmux() {
    rm -rf ${HOME}/.tmux/plugins
    #plugin manager
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
}
function main (){
    install_homebrew
    install_packages
    install_zsh_style
    setup_neovim
    setup_tmux
}
