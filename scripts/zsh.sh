#!/bin/bash
sudo apt-get install git zsh wget curl -y
sudo apt-get install net-tools -y
sudo apt-get install powerline -y

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
sh /tmp/install.sh

# install plugins
sudo apt-get install autojump
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm -f ${HOME}/.zshrc

# theme
is_theme=false
no_check=false
for i in $*; do
    if [ $i == "-p10k" ]
    then
        # powerlevel10k
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        printf "ZSH_THEME=\"powerlevel10k/powerlevel10k\"\n\n" >> ${HOME}/.zshrc
        printf "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh\n\n" >> ${HOME}/.zshrc
        is_theme=true
        cp ./config/zsh/.p10k.zsh ${HOME}
    fi
    if [ $i == "-no-check" ]
    then
        no_check=true
    fi
done
if [ $is_theme != true ]
then
    printf "\nZSH_THEME=\"robbyrussell\"\n\n" >> ${HOME}/.zshrc
fi

# zsh configuration
echo "export ZSH=\"${HOME}/.oh-my-zsh\"" >> ${HOME}/.zshrc

# plusgins
cat ./config/zsh/plugins.zsh >> ${HOME}/.zshrc

# bind autocompelet key
printf "\nbindkey ',' autosuggest-accept	# bind autocompelet\n" >> ${HOME}/.zshrc

# avoid checking
if [ $no_check == true ]
then
    printf "\nDISABLE_AUTO_UPDATE=\"true\"\n\n" >> ${HOME}/.zshrc
fi
