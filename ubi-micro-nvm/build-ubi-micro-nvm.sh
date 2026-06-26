#!/bin/bash
LATEST=v0.40.5
VERSION=${1:-latest}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y --allowerasing \
libstdc++ curl findutils less tar unzip gzip vim-minimal python3 python3-pip wget

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-nvm

if [ "$VERSION" = "latest" ]; then
  podman build --network host --build-arg VERSION=${LATEST}  -t docker.io/kakinari/ubi-micro-ja:10-nvm-${VERSION} .
  podman tag docker.io/kakinari/ubi-micro-ja:10-nvm-${VERSION} docker.io/kakinari/ubi-micro-ja:10-nvm-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-nvm-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-nvm-${LATEST}
else
  podman build --network host --build-arg VERSION=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:10-nvm-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-nvm-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-nvm-${VERSION}
podman image rm localhost/kakinari/ubi-micro-ja:10-nvm
