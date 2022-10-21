From docker-lite

RUN git clone https://github.com/jackhong12/envconf.git
RUN cd envconf && bash -x ./install.sh --omz-no-check

RUN sudo sed -i "s/\($usern:.*\/bin\/\)sh/\1zsh/g" /etc/passwd
RUN script -qc "bash -c \"zsh -is <<<''\"" /dev/null
