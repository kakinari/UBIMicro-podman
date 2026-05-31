#!/bin/bash

microcontainer=$(buildah from registry.redhat.io/ubi10-init:latest)
micromount=$(buildah mount $microcontainer)
dnf install langpacks-ja glibc-langpack-ja langpacks-fonts-ja \
            wget container-tools podman-docker xauth openssl openssh \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm -y
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y
LANG=C dnf groupinstall "Development Tools" \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y
buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-csbase
podman build -t docker.io/kakinari/ubi-micro-ja:10-csbase .
podman push docker.io/kakinari/ubi-micro-ja:10-csbase
podman image rm localhost/kakinari/ubi-micro-ja:10-csbase
podman image rm docker.io/kakinari/ubi-micro-ja:10-csbase
podman image rm registry.redhat.io/ubi10-init:latest -f
