#!/bin/bash
git submodule init
git submodule update --recursive

docker build . -t u20-denv

docker run \
    -it \
    --name denv \
    u20-denv
