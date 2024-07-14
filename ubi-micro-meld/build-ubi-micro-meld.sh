#!/bin/bash
VERSION=3.22.1

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
meld google-noto-cjk-fonts-common google-noto-sans-cjk-ttc-fonts google-noto-serif-cjk-ttc-fonts

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-meld
buildah build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-meld-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-meld-latest docker.io/kakinari/ubi-micro-ja:9-meld-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-meld-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-meld-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-meld-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-meld-${VERSION}
podman image rm localhost/kakinari/ubi-micro-ja:9-meld
