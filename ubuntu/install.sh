#!/bin/bash
path=$PWD

# pull other repo
git submodule init
git submodule update --recursive
sudo apt-get update

# install ssh
./scripts/ssh.sh

# install nerd font
./nerd-fonts/install.sh

# install .tmux
./scripts/tmux.sh $path

# install vim bundle
vim_path="${PWD}/my_vimrc"
./my_vimrc/install.sh $vim_path

# install oh-my-zsh
./scripts/zsh.sh
