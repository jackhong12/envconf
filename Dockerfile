From ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -U -m envc && \
    usermod -G users envc
RUN apt-get update && apt-get install --no-install-recommends -y \
    lsb-release \
    sudo \
    bash-completion \
    software-properties-common

# language setting
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install debconf -y
RUN apt-get install keyboard-configuration -y
RUN dpkg-reconfigure keyboard-configuration

# change mirror url
RUN sed -i 's/http:\/\/archive\.ubuntu\.com/http:\/\/free\.nchc\.org\.tw/g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/security\.ubuntu\.com/http:\/\/free\.nchc\.org\.tw/g' /etc/apt/sources.list
RUN apt-get update

RUN echo "envc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/envc
RUN chmod 0440 /etc/sudoers.d/envc
RUN chown -R envc:envc /home/envc
ENV USER=envc
ENV HOME=/home/envc

COPY ./config /home/envc/envconf/config
COPY ./fonts /home/envc/envconf/fonts
COPY ./vimrc /home/envc/envconf/vimrc
COPY ./scripts /home/envc/envconf/scripts
COPY ./.tmux /home/envc/envconf/.tmux
RUN chown -R envc:envc /home/envc/envconf

USER envc

WORKDIR /home/envc/envconf
RUN bash -x scripts/tmux.sh -a -m -n
RUN bash -x scripts/zsh.sh -p10k

# set fonts
RUN bash -x scripts/font.sh
RUN fc-cache -f -v

# vim
WORKDIR /home/envc/envconf/vimrc
RUN bash -x ./install.sh -mute

WORKDIR /home/envc
RUN sudo sed -i "s/\(envc:.*\/bin\/\)sh/\1zsh/g" /etc/passwd
RUN script -qc "bash -c \"zsh -is <<<''\"" /dev/null
