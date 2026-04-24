#!/bin/bash

# editing mode
#set -o vi
export VISUAL=nvim
export EDITOR=nvim
export TERM="screen-256color"
export BROWSER="google-chrome-stable"
export GOOGLE_CLOUD_PROJECT_ID="sbx-qsw"

HISTSIZE=1000
HISTFILESIZE=2000

### PATH configuration
export PATH=${HOME}/.local/bin:${HOME}/go/bin:${HOME}/.cargo/bin:/opt/nvim-linux-x86_64/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH

### alias
alias dev="cd ~/dev"
alias c="clear"
alias e="exit"

#alias ls="ls --color=auto"
alias ll="ls -lathr"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vim="/usr/local/bin/nvim-linux-x86_64/bin/nvim"
alias v="/usr/local/bin/nvim-linux-x86_64/bin/nvim"

alias gs="git status"
alias gc="git commit -m"
alias lg="lazygit"

alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"

alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfaa="terraform apply --auto-approve"
alias tfd="terraform destroy"

alias src-bash='source $HOME/.bashrc'
alias gauth='rm ${HOME}/.config/gcloud/*.db && gcloud auth login --update-adc'

export NVM_DIR="$HOME/.nvm"
# Lazy load NVM
nvm() {
    unset -f nvm node npm npx
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}
node() {
    unset -f nvm node npm npx
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    node "$@"
}
npm() {
    unset -f nvm node npm npx
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    npm "$@"
}
npx() {
    unset -f nvm node npm npx
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    npx "$@"
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# shellcheck disable=SC1091
source "${HOME}/dotfiles/bash/prompt"
# Optimization: Cache completions to speed up startup
COMPLETION_CACHE_DIR="${HOME}/.bash_completion_cache"
mkdir -p "${COMPLETION_CACHE_DIR}"

# kubectl completion
if [ ! -f "${COMPLETION_CACHE_DIR}/kubectl" ]; then
    kubectl completion bash > "${COMPLETION_CACHE_DIR}/kubectl"
fi
# shellcheck disable=SC1091
source "${COMPLETION_CACHE_DIR}/kubectl"
complete -o default -F __start_kubectl k

# flux completion
if [ ! -f "${COMPLETION_CACHE_DIR}/flux" ]; then
    flux completion bash > "${COMPLETION_CACHE_DIR}/flux"
fi
# shellcheck disable=SC1091
source "${COMPLETION_CACHE_DIR}/flux"

# shellcheck disable=SC1091
source /usr/share/doc/fzf/examples/key-bindings.bash
# shellcheck disable=SC1091
source /etc/bash_completion
