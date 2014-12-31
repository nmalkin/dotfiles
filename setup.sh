#!/bin/bash

dotfiles=( .bashrc .gitignore_global .tmux.conf .vim .vimrc )

for file in ${dotfiles[@]}
do
    mv -i ~/$file ~/$file.bak
    ln -s $PWD/$file ~/$file
done

# Get Vundle, then use it to install all other vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
