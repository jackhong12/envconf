#!/usr/bin/bash
docker run -it \
    --rm \
    -e "TERM=xterm-256color" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v $(pwd):/home/envc/share \
    --gpus all \
    --network host \
    --privileged=true \
    envc_img \
    zsh
