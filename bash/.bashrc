#!/bin/bash

# editing mode
#set -o vi
export VISUAL=nvim
export EDITOR=nvim
export TERM="screen-256color"
export BROWSER="google-chrome-stable"
export GOOGLE_CLOUD_PROJECT="sbx-qsw"

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

alias vim="/opt/nvim-linux-x86_64/bin/nvim"
alias v="/opt/nvim-linux-x86_64/bin/nvim"

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
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"                   # This loads nvm
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# shellcheck disable=SC1091
source "${HOME}/dotfiles/bash/prompt"
# shellcheck disable=SC1090
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

# shellcheck disable=SC1091
source /usr/share/doc/fzf/examples/key-bindings.bash
# shellcheck disable=SC1090
source <(flux completion bash)
# shellcheck disable=SC1091
source /etc/bash_completion
