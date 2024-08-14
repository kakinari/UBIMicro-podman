#!/bin/bash
VERSION=v0.39.7
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
libstdc++ curl findutils less tar unzip gzip vim-minimal python3 python3-pip

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-nvm
podman build --build-arg=VERSION=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:9-nvm .
podman push docker.io/kakinari/ubi-micro-ja:9-nvm
podman image rm localhost/kakinari/ubi-micro-ja:9-nvm
