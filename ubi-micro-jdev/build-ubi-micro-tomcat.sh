#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9)
micromount=$(buildah mount $microcontainer)
LANG=C dnf groupinstall "Development Tools" \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y 
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
java-latest-openjdk-devel
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-java22-dev
podman build -t docker.io/kakinari/ubi-micro-ja:9-java22-dev .
podman push docker.io/kakinari/ubi-micro-ja:9-java22-dev
podman image rm localhost/kakinari/ubi-micro-ja:9-java22-dev
podman image rm docker.io/kakinari/ubi-micro-ja:9-java22-dev
podman image rm docker.io/kakinari/ubi-micro-ja:9 -f
podman system prune -f
