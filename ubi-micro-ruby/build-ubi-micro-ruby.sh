#!/bin/bash
VERSION=${1:-latest}
LATEST=4.0.5

if [ "$VERSION" = "latest" ]; then
  podman build --network=host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-ruby-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-ruby-${VERSION} docker.io/kakinari/ubi-micro-ja:10-ruby-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-ruby-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-ruby-${LATEST}
else
  podman build --network=host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-ruby-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-ruby-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-ruby-${VERSION}
