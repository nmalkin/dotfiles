#!/bin/sh

git submodule init
git submodule update

mv -i ~/.vimrc ~/.vimrc.bak
mv -i ~/.vim ~/.vim.bak

ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
