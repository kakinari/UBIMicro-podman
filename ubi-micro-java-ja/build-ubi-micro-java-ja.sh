#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-jre22)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
java-latest-openjdk-devel java-latest-openjdk-jmods

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-java22
podman build -t docker.io/kakinari/ubi-micro-ja:9-java22 .
podman push docker.io/kakinari/ubi-micro-ja:9-java22
podman image rm localhost/kakinari/ubi-micro-ja:9-java22


