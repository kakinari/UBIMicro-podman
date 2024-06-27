#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-ruby-dev3)
micromount=$(buildah mount $microcontainer)
dnf install gcc g++ make rpm-build \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-jekyll
podman build -t docker.io/kakinari/ubi-micro-ja:9-jekyll .
podman push docker.io/kakinari/ubi-micro-ja:9-jekyll
podman image rm localhost/kakinari/ubi-micro-ja:9-jekyll
podman image rm docker.io/kakinari/ubi-micro-ja:9-jekyll
podman image rm docker.io/kakinari/ubi-micro-ja:9-ruby-dev3 -f
podman system prune -f
