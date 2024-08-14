#!/bin/bash
VERSION=14.1.1
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
jdk-11.0.22_linux-x64_bin.rpm \
google-noto-cjk-fonts-common \
google-noto-sans-cjk-ttc-fonts \
google-noto-serif-cjk-ttc-fonts \
firefox

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-weblogic
podman build --build-arg=VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-weblogic-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-weblogic-latest  docker.io/kakinari/ubi-micro-ja:9-weblogic-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-weblogic-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-weblogic-latest
podman image rm -f localhost/kakinari/ubi-micro-ja:9-weblogic
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-weblogic-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-weblogic-${VERSION}
