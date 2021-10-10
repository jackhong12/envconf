## Install
```bash
./install.sh
```

## Docker
- build image
```bash
./docker-build.sh
```

- run container
```bash
docker run -it --rm envc_img zsh
```

## Trouble Shooting
### install [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
```
docker: Error response from daemon: could not select device driver "" with capabilities: [[gpu]].
```

1.
```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
```

2. install nvidia-docker2
```bash
sudo apt-get update
sudo apt-get install -y nvidia-docker2
```
