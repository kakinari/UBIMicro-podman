#!/bin/bash
VERSION=${1:-3}
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:10-csbase)
micromount=$(buildah mount $microcontainer)
dnf install \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y libatomic

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:10-cs-anaconda
buildah rm $microcontainer
podman build --network host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-cs-anaconda-${VERSION} .
podman push docker.io/kakinari/ubi-micro-ja:10-cs-anaconda-${VERSION}
podman rmi -f localhost/kakinari/ubi-micro-ja:10-cs-anaconda
podman rmi -f docker.io/kakinari/ubi-micro-ja:10-cs-anaconda-${VERSION}
podman rmi -f docker.io/kakinari/ubi-micro-ja:10-csbase
