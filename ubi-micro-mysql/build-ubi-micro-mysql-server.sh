#!/bin/bash
VERSION=${1:-latest}
LATEST=8.4

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
mysql-community-server

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:10-mysql-${VERSION}

if [ "$VERSION" = "latest" ]; then
  buildah tag docker.io/kakinari/ubi-micro-ja:10-mysql-${VERSION} docker.io/kakinari/ubi-micro-ja:10-mysql-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-mysql-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-mysql-${LATEST}
fi
podman push docker.io/kakinari/ubi-micro-ja:10-mysql-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-mysql-${VERSION}
