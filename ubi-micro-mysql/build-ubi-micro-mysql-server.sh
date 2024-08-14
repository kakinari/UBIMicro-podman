#!/bin/bash
VERSION=8.4
# dnf install mysql84-community-release-el9-1.noarch.rpm
# dnf update;

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
mysql-community-server

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:9-mysql-latest
podman tag  docker.io/kakinari/ubi-micro-ja:9-mysql-latest  docker.io/kakinari/ubi-micro-ja:9-mysql-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-mysql-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-mysql-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-mysql-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-mysql-latest
