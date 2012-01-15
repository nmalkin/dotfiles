#!/bin/sh

mv -i ~/.vimrc ~/.vimrc.bak
mv -i ~/.vim ~/.vim.bak

ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
