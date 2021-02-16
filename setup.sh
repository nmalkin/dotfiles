#!/bin/zsh

set -e
set -x

mkdir -p .vim
dotfiles=( .gitconfig .gitignore_global .tmux.conf .vim .vimrc .zshrc )

#for file in ${dotfiles[@]}
#do
#    if [ -e ~/$file ] || [ -L ~/$file ]; then
#        mv -i ~/$file ~/$file.bak
#    fi
#    ln -s $PWD/$file ~/$file
#done

# Set up neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
if [ ! -e $XDG_CONFIG_HOME/nvim ] && [ ! -L $XDG_CONFIG_HOME/nvim ]; then
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
fi
if [ ! -e $XDG_CONFIG_HOME/nvim/init.vim ] && [ ! -L $XDG_CONFIG_HOME/nvim/init.vim ]; then
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi

# Install z.sh
if [ ! -e z ]; then
    git clone https://github.com/rupa/z.git
fi

# Get Vundle, then use it to install all other vim plugins
mkdir -p bundle
if [ ! -e bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
