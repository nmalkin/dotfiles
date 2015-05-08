# Use vim key bindings
bindkey -v

# Use (n)vim as preferred editor
MY_EDITOR=nvim
export EDITOR=$MY_EDITOR
export VISUAL=$MY_EDITOR
alias e=$MY_EDITOR
alias v="$MY_EDITOR -R"

# Safer defaults
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Shortened commands
alias json='python -mjson.tool'
alias epoch='date +"%s"'
alias l='less'

# Mac-specific
alias f='~/ff'
alias tmux='TERM=screen-256color-bce tmux'

# Find files by name
function search() {
    find . -iname "*$1*"
}

# Navigate up directory trees
function up {
    for i in $(seq 1 $1)
    do
        cd ..
    done
}

# Pipe ack output into less
function lack() {
    ack "$1" | less -R
}

# Make delete key actually forward-delete
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# Recall history using arrow buttons
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Search history with ctrl+R
bindkey '^R' history-incremental-search-backward

# z.sh
export _Z_CMD=c
source ~/dotfiles/z/z.sh

# Poweline
export POWERLINE_DIR=~/powerline
source $POWERLINE_DIR/bindings/zsh/powerline.zsh

source ~/local_aliases.sh