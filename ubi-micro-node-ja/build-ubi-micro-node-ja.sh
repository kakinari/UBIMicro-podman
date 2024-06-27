#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9)
micromount=$(buildah mount $microcontainer)
dnf install curl tar gzip findutils grep \
libstdc++  \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-node22
podman build -t docker.io/kakinari/ubi-micro-ja:9-node22 .
# podman push docker.io/kakinari/ubi-micro-ja:9-node22
# podman image rm docker.io/kakinari/ubi-micro-ja:9-node22
podman image rm localhost/kakinari/ubi-micro-ja:9-node22
podman system prune -f
