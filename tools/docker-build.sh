#!/bin/bash
git submodule update --init --recursive

IMG_NAME=envconf
docker build . -t $IMG_NAME

sudo cp ./tools/envconf /usr/bin
