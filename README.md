## Install
```bash
./install.sh
```

## Docker
- install [docker](https://docs.docker.com/engine/install/ubuntu/)

- add user to docker group
```bash
sudo gpasswd -a $USER docker
sudo usermod -aG docker $USER
sudo reboot
```

- install [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
```bash
# for ubuntu
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
# for gpu
sudo apt-get install nvidia-container-runtime
```

- reboot

- build image
```bash
./tools/docker-build.sh
```

- run container
```bash
docker run -it --rm envconf
# or
envconf
```

- install powerline fonts (optional)
```baash
./scripts/font.sh
```
