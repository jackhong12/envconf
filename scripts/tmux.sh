#!/bin/bash

# options:
help_msg="
options:
    -h, --help: show help messages
    -a, --separator-arrow: use arrow symbols as separators
    -m, --mouse-on: enable mouse mode
"

separator_arrow=false
is_help=false
is_mouse=false
for i in $*; do
    if [ $i == "-a" ] || [ $i == "--separator-arrow" ]
    then
        separator_arrow=true
    elif [ $i == "-h" ] || [ $i == "--help" ]
    then
        is_help=true
    elif [ $i == "-m" ] || [ $i == "--is_mouse" ]
    then
        is_mouse=true
    fi
done


if [ $is_help == true ]
then
    echo "${help_msg}"
    exit 0
fi


rm -f ${HOME}/.tmux.conf
rm -f ${HOME}/.tmux.conf.local

sudo apt-get install tmux autojump -y
ln -s -f $(pwd)/.tmux/.tmux.conf ${HOME}/.tmux.conf
cp $(pwd)/.tmux/.tmux.conf.local ${HOME}/.tmux.conf.local


# modify separator symbols
if [ $separator_arrow == true ]
then
    sed -i 's/\(tmux_conf_theme_left_separator_main="\).*\("\)/\1\\uE0B0\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_left_separator_sub="\).*\("\)/\1\\uE0B1\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_right_separator_main="\).*\("\)/\1\\uE0B2\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_right_separator_sub="\).*\("\)/\1\\uE0B3\2/g' ~/.tmux.conf.local
else
    sed -i 's/\(tmux_conf_theme_left_separator_main="\).*\("\)/\1\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_left_separator_sub="\).*\("\)/\1|\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_right_separator_main="\).*\("\)/\1\2/g' ~/.tmux.conf.local
    sed -i 's/\(tmux_conf_theme_right_separator_sub="\).*\("\)/\1|\2/g' ~/.tmux.conf.local
fi

# mouse mode
if [ $is_mouse == true ]
then
    sed -i 's/.*\(set -g mouse on\)/\1/g' ~/.tmux.conf.local
else
    sed -i 's/.*\(set -g mouse on\)/#\1/g' ~/.tmux.conf.local
fi
