#!/bin/bash

dotfiles=( .vimrc .vim .gitignore_global )

for file in ${dotfiles[@]}
do
    mv -i ~/$file ~/$file.bak
    ln -s $PWD/$file ~/$file
done
