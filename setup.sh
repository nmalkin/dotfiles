#!/bin/bash


dotfiles=( .gitconfig .gitignore_global .tmux.conf .vim .vimrc .zshrc )

for file in ${dotfiles[@]}
do
    mv -i ~/$file ~/$file.bak
    ln -s $PWD/$file ~/$file
done

# Set up neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# Install z.sh
git clone https://github.com/rupa/z.git

# Get Vundle, then use it to install all other vim plugins
mkdir bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
