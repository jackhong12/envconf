#!/bin/bash

# pull other repo
git submodule init
git submodule update --recursive
sudo apt-get update

python3 install.py

# for vim
cd vimrc && python3 ../install.py
