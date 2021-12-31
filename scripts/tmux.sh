#!/bin/bash

# options:
help_msg="
options:
    -h, --help: show help messages
    -a, --separator-arrow: use arrow symbols as separators
    -m, --mouse-on: enable mouse mode
    -n, --theme-navy: navy colour theme
    -t, --bar-top: move status bar to the top
"

separator_arrow=false
is_help=false
is_mouse=false
colour_theme='default'
status_bar_position='down'
for i in $*; do
    if [ $i == "-a" ] || [ $i == "--separator-arrow" ]
    then
        separator_arrow=true
    elif [ $i == "-h" ] || [ $i == "--help" ]
    then
        is_help=true
    elif [ $i == "-m" ] || [ $i == "--mouse-on" ]
    then
        is_mouse=true
    elif [ $i == "-n" ] || [ $i == "--theme-navy" ]
    then
        colour_theme='navy'
    elif [ $i == "-t" ] || [ $i == "--bar-top" ]
    then
        status_bar_position='top'
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

# position of status bar
if [ $status_bar_position == 'top' ]
then
    sed -i 's/.*\(set -g status-position top\)/\1/g' ~/.tmux.conf.local
else
    sed -i 's/.*\(set -g status-position top\)/#\1/g' ~/.tmux.conf.local
fi

# theme
if [ $colour_theme == 'navy' ]
then
    blue_theme_colour='\ntmux_conf_theme_colour_navy="#193498"\ntmux_conf_theme_colour_blue="#113cfc"\ntmux_conf_theme_colour_light_blue="#1597e5"\ntmux_conf_theme_colour_teal="#69dadb"'
    sed -i "s/\(^tmux_conf_theme_colour_17=.*\)/\1${blue_theme_colour}/g" ~/.tmux.conf.local
    sed -i "s/\(.*\)\(tmux_conf_theme_colour_4\)\([^=].*\)/\1tmux_conf_theme_colour_light_blue\3/g" ~/.tmux.conf.local
    sed -i "s/\(.*\)\(tmux_conf_theme_colour_9\)\([^=].*\)/\1tmux_conf_theme_colour_teal\3/g" ~/.tmux.conf.local
    sed -i "s/\(.*\)\(tmux_conf_theme_colour_17\)\([^=].*\)/\1tmux_conf_theme_colour_teal\3/g" ~/.tmux.conf.local
    sed -i "s/\(.*\)\(tmux_conf_theme_colour_10\)\([^=].*\)/\1tmux_conf_theme_colour_navy\3/g" ~/.tmux.conf.local
    sed -i "s/\(.*\)\(tmux_conf_theme_colour_16\)\([^=].*\)/\1tmux_conf_theme_colour_navy\3/g" ~/.tmux.conf.local
fi
