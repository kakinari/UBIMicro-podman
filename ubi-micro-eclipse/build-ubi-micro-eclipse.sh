#!/usr/bin/bash
LATEST=2026-06
VERSION=${1:-latest}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-jdev)
micromount=$(buildah mount $microcontainer)
dnf install gtk3 mesa-dri-drivers mesa-libGL \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-eclipse

if [ "$VERSION" = "latest" ]; then
  podman build --network host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-eclipse-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-eclipse-${VERSION} docker.io/kakinari/ubi-micro-ja:10-eclipse-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-eclipse-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-eclipse-${LATEST}
else
  podman build --network host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-eclipse-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-eclipse-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-eclipse-${VERSION}
podman image rm -f localhost/kakinari/ubi-micro-ja:10-eclipse
