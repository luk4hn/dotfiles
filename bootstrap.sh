#!/bin/bash

_project_path=$(dirname $(readlink -f $0))

##
for _file in .bashrc .screenrc .tmux.conf .Xdefaults .gitconfig .Xresources ; do 
    ln -svf "$_project_path/$_file" "$HOME/$_file"
done
