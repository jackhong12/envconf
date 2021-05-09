From ubuntu:20.04

COPY . /home/envconf
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --assume-yes apt-utils
RUN apt-get install python3 -y

WORKDIR '/home/envconf'
RUN python3 install.py -docker

# vim
WORKDIR '/home/envconf/vimrc'
RUN python3 ../install.py -docker

CMD ["zsh"]
WORKDIR '/root'
