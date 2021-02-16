set fish_greeting ''

set my_editor nvim
set -x EDITOR $my_editor
set -x VISUAL $my_editor

functions -c cd __cd_original
function cd --wraps cd
    __cd_original $argv
    ls
end

function up
    for i in (seq 1 $argv[1])
        cd ..
    end
end

alias c='z'
alias clc='echo "" | pbcopy'

function cp --wraps cp
     command cp -i $argv
end
function mv --wraps mv
     command mv -i $argv
end
function rm --wraps rm
     command rm -i $argv
end

function _update_tmux_prompt --on-event fish_prompt --description 'Update tmux window name to current directory'
    if test -n "$TMUX"
        if [ $PWD = $HOME ]
            set name "~"
        else
            set name (basename $PWD)
        end

        tmux rename-window $name
    end
end

function _update_tmux_cmd --on-event fish_preexec --description 'Update tmux window name to current command'
    if test -n "$TMUX"
        set full_command $argv[1]
        set name (string sub --length=10 $full_command)
        tmux rename-window $name
    end
end

set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths
