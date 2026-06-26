#!/usr/bin/bash
VERSION=${1:-latest}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-dev)
micromount=$(buildah mount $microcontainer)
dnf install \
java-${VERSION}-openjdk \
java-${VERSION}-openjdk-devel \
java-${VERSION}-openjdk-jmods \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-jdev
podman build --build-arg TARGET=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-jdev-${VERSION} .
if [ "$VERSION" = "latest" ]; then
  podman tag  docker.io/kakinari/ubi-micro-ja:10-jdev-${VERSION} docker.io/kakinari/ubi-micro-ja:10-jdev
  podman push docker.io/kakinari/ubi-micro-ja:10-jdev
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jdev
fi
podman push docker.io/kakinari/ubi-micro-ja:10-jdev-${VERSION}
podman image rm -f localhost/kakinari/ubi-micro-ja:10-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jdev-${VERSION}
