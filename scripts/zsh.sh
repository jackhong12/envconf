#!/bin/bash
sudo apt-get install git zsh wget curl -y
sudo apt-get install powerline -y

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
sh /tmp/install.sh

# install plugins
sudo apt-get install autojump
curl -L git.io/antigen > ${HOME}/antigen.zsh

# configuration
echo "export ZSH=\"${HOME}/.oh-my-zsh\"" > ${HOME}/.zshrc
cat ./config/zsh/basic.zsh >> ${HOME}/.zshrc
cat ./config/zsh/antigen_setting.zsh >> ${HOME}/.zshrc
