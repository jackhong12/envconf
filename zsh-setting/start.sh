#!/bin/bash
apt-get install zsh curl -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/jackhong12/my-docker.git ~/my_docker
cp ~/my_docker/zsh-setting/.zshrc ~/.zshrc
apt-get install autojump
curl -L git.io/antigen > ~/antigen.zsh
