#!/bin/bash
VERSION=${1:-latest}
LATEST=18.4

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-dev)
micromount=$(buildah mount $microcontainer)
dnf install readline-devel icu libicu-devel libxml2-devel tcl-devel perl lz4-devel systemd-devel python3-devel perl-ExtUtils-MakeMaker perl-ExtUtils-MakeMaker-CPANfile openssl-devel \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-dev

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-base)
micromount=$(buildah mount $microcontainer)
dnf install readline libicu libxml2 openssl \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-postgres

if [ "$VERSION" = "latest" ]; then
  podman build --network host --build-arg TARGET=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-postgres-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-postgres-${VERSION} docker.io/kakinari/ubi-micro-ja:10-postgres-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-postgres-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-postgres-${LATEST}
else
  podman build --network host --build-arg TARGET=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-postgres-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-postgres-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-postgres-${VERSION}
podman image rm -f localhost/kakinari/ubi-micro-ja:10-postgres
podman image rm -f localhost/kakinari/ubi-micro-ja:10-dev
