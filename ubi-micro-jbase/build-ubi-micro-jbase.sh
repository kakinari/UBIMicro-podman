#!/bin/bash
VERSION=22
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
java-latest-openjdk \
google-noto-cjk-fonts-common google-noto-sans-cjk-ttc-fonts google-noto-serif-cjk-ttc-fonts

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-jbase
podman build --build-arg=VERSION=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:9-jbase .
podman tag  docker.io/kakinari/ubi-micro-ja:9-jbase docker.io/kakinari/ubi-micro-ja:9-jbase-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jbase-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jbase
podman image rm -f localhost/kakinari/ubi-micro-ja:9-jbase
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase-${VERSION}
