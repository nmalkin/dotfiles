#!/bin/bash

git submodule init
git submodule update

dotfiles=( .vimrc .vim .gitconfig .gitignore_global )

for file in ${dotfiles[@]}
do
    mv -i ~/$file ~/$file.bak
    ln -s $PWD/$file ~/$file
done
