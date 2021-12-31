#!/bin/bash

# pull other repo
git submodule init
git submodule update --recursive
sudo apt-get update

bash -x ./scripts/font.sh
bash -x ./scripts/ssh.sh
bash -x ./scripts/tmux.sh -a -m -n
bash -x ./scripts/zsh.sh -p10k

# vim
cd ./vimrc && bash -x ./install.sh
