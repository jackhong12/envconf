#!/bin/bash
git submodule init
git submodule update --recursive

docker build . -t envc_img
