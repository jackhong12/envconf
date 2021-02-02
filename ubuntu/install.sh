#!/bin/bash
path=$PWD

# pull other repo
git submodule init
git submodule update --recursive

# install .tmux
./scripts/tmux.sh $path
