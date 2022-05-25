#!/bin/bash

# pull other repo
git submodule update --recursive --init
sudo apt-get update

# options:
help_msg="options:
    -h, --help: show help messages
    --omz-no-check: don't update oh-my-zsh
"

tmux_separator_arrow=true
tmux_mouse=true
tmux_theme_navy=true

zsh_theme=p10k
zsh_no_check=false

for i in $*; do
    if [ $i == "-h" ] || [ $i == "--help" ]
    then
        printf "${help_msg}"
        exit 0
    elif [ $i == "--omz-no-check" ]
    then
        zsh_no_check=true
    else
        printf "[ERROR] No option: ${i}\n\n"
        printf "${help_msg}"
        exit 1
    fi
done

# font
bash -x ./scripts/font.sh

# ssh
bash -x ./scripts/ssh.sh

# tmux
tmux_option=""
if [ $tmux_separator_arrow == "true" ]
then
    tmux_option="${tmux_option} -a"
fi
if [ $tmux_mouse == "true" ]
then
    tmux_option="${tmux_option} -m"
fi
if [ $tmux_theme_navy == "true" ]
then
    tmux_option="${tmux_option} -n"
fi
bash -x ./scripts/tmux.sh $tmux_option

# zsh
zsh_option=""
if [ $zsh_theme == "p10k" ]
then
    zsh_option="${zsh_option} -p10k"
fi
if [ $zsh_no_check == "true" ]
then
    zsh_option="${zsh_option} -no-check"
fi
bash -x ./scripts/zsh.sh ${zsh_option}

# vim
cd ./vimrc && bash -x ./install.sh && cd ..
