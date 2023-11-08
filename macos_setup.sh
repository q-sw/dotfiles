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

# Install requirements Dev/DevOps tools
function install_devops_tools(){
    DEVOPS_TOOLS=('go' 'terraform' 'docker' 'minikube' 'ansible'\
        'terraform-docs' 'tmux' '--cask visual-studio-code' '--cask google-cloud-sdk'\
        '--cask drawio' 'neovim', 'ripgrep')

    for dt in "${DEVOPS_TOOLS[@]}"; do
        brew install $dt
    done
}


# Install productivity tools
function install_productivity_tools(){
    PRODUCTIVITY_TOOLS=('clipy' 'google-chrome' 'google-drive' 'adobe-acrobat-reader'\
        'spectacle')

    for pt in "${PRODUCTIVITY_TOOLS[@]}"; do
        brew install --cask $pt
    done
}

# Install font
function install_font ()
{
 brew tap homebrew/cask-fonts
 brew install font-fira-code
}

# Install Oh my ZSH - Powerlevel10k
function install_zsh_style(){
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

    ln -s $(pwd)/zshrc ${HOME}/.zshrc
    ln -s $(pwd)/p10k.zsh ${HOME}/.p10k.zsh
}


function setup_neovim() {
    # Clean up previous config
    rm -rf ${HOME}/.config/nvim

    rm -rf  ${HOME}/.local/share/nvim
    rm -rf ${HOME}/.local/state/nvim
    rm -rf ${HOME}/.cache/nvim

    # Install plugin manager
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim

    ln -s $(pwd)/nvim ${HOME}/.config/nvim
}

function setup_tmux() {
    rm -rf ${HOME}/.tmux/plugins
    #plugin manager
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
    ln -s $(pwd)/tmux.conf ${HOME}/.tmux.conf
}

function other_tools(){
    BREW_OTHER_TOOLS=('vlc' 'spotify' )

}

function main(){
    install_homebrew
    install_devops_tools
    install_productivity_tools
    install_font
    install_zsh_style
    setup_neovim
    setup_tmux

    git config credential.helper store
    }

    main

