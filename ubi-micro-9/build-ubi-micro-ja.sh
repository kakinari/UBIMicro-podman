#!/bin/bash

microcontainer=$(buildah from registry.access.redhat.com/ubi9/ubi-micro)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
glibc-langpack-ja
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9
podman build -t docker.io/kakinari/ubi-micro-ja:9 .
podman push docker.io/kakinari/ubi-micro-ja:9
podman image rm localhost/kakinari/ubi-micro-ja:9
