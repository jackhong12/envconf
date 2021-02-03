#!/bin/bash
path=$PWD

# pull other repo
git submodule init
git submodule update --recursive

# install nerd font
./nerd-fonts/install.sh

# install .tmux
./scripts/tmux.sh $path

# install vim bundle
vim_path="${PWD}/my_vimrc"
./my_vimrc/install.sh $vim_path

# install oh-my-zsh
./scripts/zsh.sh
