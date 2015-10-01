### Manage history
HISTFILE=~/.zshistory
# Ignore duplicate history entries
setopt histignoredups

# Keep more history
export HISTSIZE=10000
export SAVEHIST=10000

# Add commands as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

### Set up prompt
# Turn on colors
autoload -U colors && colors

# Expand functions in the prompt
setopt prompt_subst

# Set prompt string
export PS1='%{$fg_bold[blue]%}%~%{$reset_color%} '

### Completion
# Enable command completion
autoload -U compinit
compinit

# Allow completion from both ends of the cursor
setopt completeinword

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Show colors during completion
zstyle ':completion:*' list-colors ''

# cd by entering just the directory name
setopt auto_cd

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
alias g='git'
alias l='less'
alias ls='ls -G'
alias ll='ls -l'

# Mac-specific
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
function lag() {
    ag "$1" | less -R
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

# Use fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
