set -o vi

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Enable colors in tmux (for vim)
alias tmux='TERM=screen-256color-bce tmux'

alias e='vim'
alias v='vim -R'
alias l='less'
alias epoch='date +"%s"'
alias json='python -mjson.tool'

function lack() {
    ack "$1" | less -R
}

function search() {
    find . -iname *$1*
}

function up {
    for i in $(seq 1 $1); do
        cd ..
    done
}

function tunnel {
    HOST=$1
    PORT=$2
    ssh -L $PORT:localhost:$PORT $HOST
}
