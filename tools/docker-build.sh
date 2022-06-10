#!/bin/bash
git submodule update --init --recursive
docker pull ubuntu:20.04

IMG_NAME=envconf
docker build . \
    --build-arg usern=$IMG_NAME \
    --build-arg USER_UID=$(id -g $USER) \
    --build-arg USER_GID=$(id -g $USER) \
    -t $IMG_NAME

sudo cp ./tools/envconf /usr/bin
