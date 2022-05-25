From ubuntu:20.04

################################################################################
# first part
################################################################################
ARG DEBIAN_FRONTEND=noninteractive
ENV usern envconf
RUN useradd -U -m $usern && \
    usermod -G users $usern
RUN apt-get update && apt-get install --no-install-recommends -y \
    lsb-release \
    sudo \
    bash-completion \
    software-properties-common
RUN sudo apt-get install git -y

################################################################################
# second part
################################################################################
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

RUN echo "$usern ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$usern
RUN chmod 0440 /etc/sudoers.d/$usern
RUN chown -R $usern:$usern /home/$usern
ENV USER=$usern
ENV HOME=/home/$usern
USER $usern

WORKDIR /home/$usern

RUN git clone https://github.com/jackhong12/envconf.git
RUN cd envconf && bash -x ./install.sh --omz-no-check

RUN sudo sed -i "s/\($usern:.*\/bin\/\)sh/\1zsh/g" /etc/passwd
RUN script -qc "bash -c \"zsh -is <<<''\"" /dev/null
