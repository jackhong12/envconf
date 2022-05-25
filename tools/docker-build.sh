#!/bin/bash
git submodule update --init --recursive
docker pull ubuntu:20.04

IMG_NAME=envconf
docker build . -t $IMG_NAME

sudo cp ./tools/envconf /usr/bin
