#!/bin/bash
git submodule update --init --recursive
docker pull ubuntu:20.04

USERNAME=envconf
LITE=docker-lite
FULL=$USERNAME
docker build . \
    --file ./tools/Dockerfile.lite \
    --build-arg usern=$USERNAME \
    --build-arg USER_UID=$(id -g $USER) \
    --build-arg USER_GID=$(id -g $USER) \
    -t $LITE

docker build . \
    --file ./tools/Dockerfile \
    --build-arg usern=$USERNAME \
    --build-arg USER_UID=$(id -g $USER) \
    --build-arg USER_GID=$(id -g $USER) \
    -t $FULL

sudo cp ./tools/envconf /usr/bin
sudo cp ./tools/docker-lite /usr/bin
