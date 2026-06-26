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
java-${VERSION}-openjdk-headless

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-jbase-nx
podman build --build-arg TARGET=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:10-jbase-nx-${VERSION} .
if [ "$VERSION" = "latest" ]; then
  podman tag  docker.io/kakinari/ubi-micro-ja:10-jbase-nx-${VERSION} docker.io/kakinari/ubi-micro-ja:10-jbase-nx
  podman push docker.io/kakinari/ubi-micro-ja:10-jbase-nx
fi
podman push docker.io/kakinari/ubi-micro-ja:10-jbase-nx-${VERSION}
podman image rm -f localhost/kakinari/ubi-micro-ja:10-jbase-nx
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jbase-nx-${VERSION}
