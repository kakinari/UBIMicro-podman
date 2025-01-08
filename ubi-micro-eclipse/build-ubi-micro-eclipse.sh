#!/usr/bin/bash
VERSION=2024-12
microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-jdev)
micromount=$(buildah mount $microcontainer)
dnf install webkit2gtk3 mesa-dri-drivers mesa-libGL \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-eclipse
podman build -t docker.io/kakinari/ubi-micro-ja:9-eclipse-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-eclipse-latest docker.io/kakinari/ubi-micro-ja:9-eclipse-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-eclipse-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-eclipse-latest
podman image rm -f localhost/kakinari/ubi-micro-ja:9-eclipse
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-eclipse-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-eclipse-${VERSION}
