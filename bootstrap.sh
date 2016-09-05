#!/bin/bash

_project_path=$(dirname $(readlink -f $0))

##
for _file in .bashrc .zshrc .screenrc .tmux.conf .Xdefaults .gitconfig .Xresources ; do 
    ln -svf "$_project_path/$_file" "$HOME/$_file"
done

for _file in i3 compton.conf ; do 
    ln -svf "$_project_path/$_file" "$HOME/.config/$_file"
done
