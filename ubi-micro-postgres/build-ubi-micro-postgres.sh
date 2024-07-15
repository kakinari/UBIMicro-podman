#!/bin/bash
VERSION=16.3

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-dev)
micromount=$(buildah mount $microcontainer)
dnf install readline-devel icu libicu-devel libxml2-devel tcl-devel perl lz4-devel systemd-devel python3-devel perl-ExtUtils-MakeMaker perl-ExtUtils-MakeMaker-CPANfile \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount
buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-dev

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9-base)
micromount=$(buildah mount $microcontainer)
dnf install readline libicu libxml2 \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y; \
dnf clean all \
--installroot $micromount
buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-postgres
podman build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-postgres-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-postgres-latest docker.io/kakinari/ubi-micro-ja:9-postgres-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-postgres-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-postgres-latest
podman image rm localhost/kakinari/ubi-micro-ja:9-postgres -f
podman image rm docker.io/kakinari/ubi-micro-ja:9-postgres-latest -f
podman image rm docker.io/kakinari/ubi-micro-ja:9-postgres-${VERSION} -f
podman image rm localhost/kakinari/ubi-micro-ja:9-dev -f
