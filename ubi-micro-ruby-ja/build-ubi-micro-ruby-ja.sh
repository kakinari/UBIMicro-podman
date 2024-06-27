#!/bin/bash

microcontainer=$(buildah from docker.io/kakinari/ubi-micro-ja:9)
micromount=$(buildah mount $microcontainer)
dnf install ruby rubygems rubygem-bigdecimal \
rubygem-bundler rubygem-json \
rubygem-rdoc rubygem-io-console \
--installroot $micromount \
--releasever=/ \
--setopt install_weak_deps=false \
--setopt=reposdir=/etc/yum.repos.d/ \
--nodocs -y

dnf clean all \
--installroot $micromount

buildah umount $microcontainer
buildah commit $microcontainer localhost/kakinari/ubi-micro-ja:9-ruby3
podman build -t docker.io/kakinari/ubi-micro-ja:9-ruby3 .
podman push docker.io/kakinari/ubi-micro-ja:9-ruby3
podman image rm localhost/kakinari/ubi-micro-ja:9-ruby3
podman image rm docker.io/kakinari/ubi-micro-ja:9-ruby3
podman system prune -f
