#!/bin/bash
VERSION=${1:-latest}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
java-${VERSION}-openjdk \
java-${VERSION}-openjdk-devel \
java-${VERSION}-openjdk-jmods

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-jbase
podman build --build-arg TARGET=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:10-jbase-${VERSION} .
if [ "$VERSION" = "latest" ]; then
  podman tag  docker.io/kakinari/ubi-micro-ja:10-jbase-${VERSION} docker.io/kakinari/ubi-micro-ja:10-jbase
  podman push docker.io/kakinari/ubi-micro-ja:10-jbase
fi
podman push docker.io/kakinari/ubi-micro-ja:10-jbase-${VERSION}
podman image rm -f localhost/kakinari/ubi-micro-ja:10-jbase
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jbase-${VERSION}
