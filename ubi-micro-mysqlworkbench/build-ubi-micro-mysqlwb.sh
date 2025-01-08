#!/bin/bash
VERSION=8.0.40

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
webkit2gtk3 mesa-dri-drivers mesa-libGL

dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
./mysql-workbench-community-8.0.40-1.el9.x86_64.rpm

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-mysql-workbench
buildah build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-latest docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-mysql-workbench-${VERSION}
podman image rm localhost/kakinari/ubi-micro-ja:9-mysql-workbench
