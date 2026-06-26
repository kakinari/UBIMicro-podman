#!/bin/bash
VERSION=${1:-latest}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-csbase)
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
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-cs-java
buildah rm $microcontainer
podman build --build-arg VERSION=${VERSION}  -t docker.io/kakinari/ubi-micro-ja:10-cs-java-${VERSION} .
podman push docker.io/kakinari/ubi-micro-ja:10-cs-java-${VERSION}
podman rmi -f localhost/kakinari/ubi-micro-ja:10-cs-java
# podman rmi -f docker.io/kakinari/ubi-micro-ja:10-cs-java-${VERSION}
# podman rmi -f docker.io/kakinari/ubi-micro-ja:10-csbase
