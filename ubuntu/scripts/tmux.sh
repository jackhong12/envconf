#!/bin/bash
echo $1

if [ -z "$1" ]
then
    path="${HOME}/.tmux"
    rm -rf $path
    git clone https://github.com/gpakosz/.tmux.git $path > /dev/null 2>&1 || exit 1
    ishome=true
else
    path="${1}/.tmux"
    ishome=false
fi
conf="${path}/.tmux.conf"
conf_local="${path}/.tmux.conf.local"

echo "
=====================================
> Install .tmux
    - path: $path
====================================="

set -x
rm -f ~/.tmux.conf
rm -f ~/.tmux.conf.local

sudo apt-get install tmux autojump -y > /dev/null
ln -s -f $conf ~/.tmux.conf
cp $conf_local ~/.tmux.conf.local
