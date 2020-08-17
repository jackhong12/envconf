From ubuntu:18.04

RUN apt-get update && apt-get install gdb ssh git vim curl zsh -y

# vim configration
RUN git clone https://github.com/jackhong12/my_vimrc.git ~/my_vimrc && cp ~/my_vimrc/.vimrc ~/.vimrc
RUN mkdir -p ~/.vim/colors && cp ~/my_vimrc/color/molokai.vim ~/.vim/colors/
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle && vim +PluginInstall +qall
# for plugin tabular
#RUN apt-get install exuberant-ctags 

# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/jackhong12/my-docker.git ~/my_docker && cp ~/my_docker/zsh-setting/.zshrc ~/.zshrc
RUN apt-get install autojump
RUN curl -L git.io/antigen > ~/antigen.zsh
RUN exec zsh
