#!/usr/bin/bash
VERSION=${1:-latest}
LATEST=3.9.16

if [ "${VERSION}" = "latest" ]; then
  podman build --network=host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-maven-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-maven-${VERSION} docker.io/kakinari/ubi-micro-ja:10-maven-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-maven-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-maven-${LATEST}
else
  podman build --network=host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-maven-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-maven-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-maven-${VERSION}
