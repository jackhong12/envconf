#!/bin/bash
path=$PWD

# pull other repo
git submodule init
git submodule update --recursive

# install nerd font
./nerd-fonts/install.sh

# install .tmux
./scripts/tmux.sh $path
