#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-node20)
micromount=$(buildah mount $microcontainer)
dnf module enable nodejs:20  \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf module install nodejs/development  \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:9-node-dev20
podman push docker.io/kakinari/ubi-micro-ja:9-node-dev20
podman image rm docker.io/kakinari/ubi-micro-ja:9-node-dev20
podman system prune -f
