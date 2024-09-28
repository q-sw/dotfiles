### editing mode
set -o vi
export VISUAL=nvim
export EDITOR=nvim
export TERM="screen-256color-bce"
export BROWSER="firefox"

### PATH configuration
setopt extended_glob null_glob
path=(
    $path
    $HOME/.local/bin
    $HOME/go/bin
    /usr/local/go/bin
    /usr/local/bin/nvim-linux64/bin
    $HOME/.tmux/plugins/tmuxifier/bin
)

typeset -U path
path=($^path(N-/))

export PATH

### history configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

### prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

### plugins
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
### alias
alias c="clear"
alias t="tmux"
alias e="exit"

alias ls="ls --color=auto"
alias ll="ls -lathr"

alias vim="/usr/local/bin/nvim-linux64/bin/nvim"
alias v="/usr/local/bin/nvim-linux64/bin/nvim"

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

### completion
fpath+=~/.zfunc

autoload -U compinit; compinit

#zstyle ':completion:*' menu select
#fpath+=~/.zfunc; autoload -U compinit; compinit
# kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

