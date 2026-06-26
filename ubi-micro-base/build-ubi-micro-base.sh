#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10)
micromount=$(buildah mount $microcontainer)
dnf install  xauth openssl openssh gh \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y ; \
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:10-base
podman push docker.io/kakinari/ubi-micro-ja:10-base
