#!/usr/bin/bash
VERSION=22
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-dev)
micromount=$(buildah mount $microcontainer)
dnf install \
java-latest-openjdk-devel \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-jdev
podman build --build-arg=TARGET=22 -t docker.io/kakinari/ubi-micro-ja:9-jdev .
podman tag  docker.io/kakinari/ubi-micro-ja:9-jdev docker.io/kakinari/ubi-micro-ja:9-jdev-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jdev-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jdev
podman image rm -f localhost/kakinari/ubi-micro-ja:9-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jdev-${VERSION}
