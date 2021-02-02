#!/bin/bash
conf_file="${HOME}/.zshrc"
set -x
sudo apt-get install zsh -y

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
sh /tmp/install.sh

# install plugins
sudo apt-get install autojump
curl -L git.io/antigen > ~/antigen.zsh

mv ~/.zshrc ~/.zshrc.backup > /dev/null 2>&1
# configuration
echo "export ZSH=\"${HOME}/.oh-my-zsh\"" > $conf_file
cat ./config/zsh/basic.zsh >> $conf_file
cat ./config/zsh/antigen_setting.zsh >> $conf_file
