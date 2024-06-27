#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9)
micromount=$(buildah mount $microcontainer)
dnf install  xauth  \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y 

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-base
podman build -t docker.io/kakinari/ubi-micro-ja:9-base .
podman push docker.io/kakinari/ubi-micro-ja:9-base
podman image rm localhost/kakinari/ubi-micro-ja:9-base
