#!/bin/sh

git submodule init
git submodule update

mv -i ~/.vimrc ~/.vimrc.bak
mv -i ~/.vim ~/.vim.bak
mv -i ~/.pentadactylrc ~/.pentadactylrc.bak
mv -i ~/.gitconfig ~/.gitconfig.bak
mv -i ~/.gitignore_global ~/.gitignore_global.bak

ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.pentadactylrc ~/.pentadactylrc 
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore_global ~/.gitignore_global
