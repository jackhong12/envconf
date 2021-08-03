#!/bin/bash

# pull other repo
git submodule init
git submodule update --recursive
sudo apt-get update

bash -x ./scripts/font.sh
bash -x ./scripts/ssh.sh
bash -x ./scripts/tmux.sh
bash -x ./scripts/zsh.sh

# vim
cd ./vimrc && bash -x ./install.sh
