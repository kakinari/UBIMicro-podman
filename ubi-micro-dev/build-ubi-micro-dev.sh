#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9)
micromount=$(buildah mount $microcontainer)
LANG=C dnf groupinstall "Development Tools" \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y ; \
dnf install vim-minimal openssl-devel libffi-devel libyaml-devel \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf remove java-1.8.0-openjdk-headless \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:9-dev
podman push docker.io/kakinari/ubi-micro-ja:9-dev
