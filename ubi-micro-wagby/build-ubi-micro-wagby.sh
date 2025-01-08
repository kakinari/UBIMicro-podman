#!/usr/bin/bash
VERSION=17
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-dev)
micromount=$(buildah mount $microcontainer)
dnf install \
java-${VERSION}-openjdk-devel git \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-jdev
podman build  --build-arg TARGET=17 -t docker.io/kakinari/ubi-micro-ja:9-wagby-9.2.6 .
podman push docker.io/kakinari/ubi-micro-ja:9-wagby-9.2.6 .
podman image rm -f localhost/kakinari/ubi-micro-ja:9-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-wagby-9.2.6 .
