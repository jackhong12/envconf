#!/bin/bash
rm -f ${HOME}/.tmux.conf
rm -f ${HOME}/.tmux.conf.local

sudo apt-get install tmux autojump -y
ln -s -f $(pwd)/.tmux/.tmux.conf ${HOME}/.tmux.conf
cp $(pwd)/.tmux/.tmux.conf.local ${HOME}/.tmux.conf.local
