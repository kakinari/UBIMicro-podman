#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-base)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y \
meld 

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-meld
buildah build -t docker.io/kakinari/ubi-micro-ja:10-meld-latest .
podman push docker.io/kakinari/ubi-micro-ja:10-meld-latest
podman image rm localhost/kakinari/ubi-micro-ja:10-meld
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-meld-latest
