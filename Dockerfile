From ubuntu:20.04

WORKDIR /home/envc

ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -U -m envc && \
    usermod -G users envc
RUN apt-get update && apt-get install --no-install-recommends -y \
    lsb-release \
    sudo \
    bash-completion \
    software-properties-common

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "envc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/envc
RUN chmod 0440 /etc/sudoers.d/envc
RUN chown -R envc:envc /home/envc
ENV USER=envc
ENV HOME=/home/envc
USER envc

COPY . /home/envc/envconf
WORKDIR /home/envc/envconf
RUN bash -x scripts/tmux.sh
RUN bash -x scripts/zsh.sh
# set fonts
RUN bash -x scripts/font.sh
RUN fc-cache -f -v
ENV TERM=screen-256color
# vim
WORKDIR /home/envc/envconf/vimrc
RUN bash -x ./install.sh -mute

WORKDIR /home/envc
CMD ["zsh"]
