# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### editing mode
#set -o vi
export VISUAL=nvim
export EDITOR=nvim
#export TERM="screen-256color-bce"
export TERM="screen-256color"
export BROWSER="firefox"


### PATH configuration
export PATH=${HOME}/.local/bin:${HOME}/go/bin:${HOME}/.cargo/bin:/usr/local/bin/nvim-linux64/bin:$PATH

### history configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

### prompt
#fpath+=($HOME/.zsh/pure)
#autoload -U promptinit; promptinit
#prompt pure

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

### plugins
#source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

### alias
alias dev="cd ~/dev"
alias c="clear"
#alias t="tmux"
alias e="exit"

#alias ls="ls --color=auto"
alias ll="ls -lathr"

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

alias src-zsh="source ${HOME}/.zshrc"
alias gauth="rm $HOME/.config/gcloud/*.db && gcloud auth login --update-adc"

### completion
fpath+=~/.zfunc

autoload -U compinit; compinit

#zstyle ':completion:*' menu select
#fpath+=~/.zfunc; autoload -U compinit; compinit
# kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
