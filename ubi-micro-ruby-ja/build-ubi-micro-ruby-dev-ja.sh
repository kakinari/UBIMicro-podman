#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-ruby3)
micromount=$(buildah mount $microcontainer)
LANG=C dnf group install "Development Tools"  \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf install ruby-devel rbenv \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer docker.io/kakinari/ubi-micro-ja:9-ruby-dev3
podman push docker.io/kakinari/ubi-micro-ja:9-ruby-dev3
podman image rm docker.io/kakinari/ubi-micro-ja:9-ruby-dev3
podman image rm docker.io/kakinari/ubi-micro-ja:9-ruby3 -f
podman system prune -f
