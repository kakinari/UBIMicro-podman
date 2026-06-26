#!/usr/bin/bash
VERSION=${1:-latest}
TARGET=25.0.3

if [ "$VERSION" = "latest" ]; then
  podman build --network=host --build-arg TARGET="${TARGET}-graal" -t docker.io/kakinari/ubi-micro-ja:10-graal-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-graal-${VERSION} docker.io/kakinari/ubi-micro-ja:10-graal-${TARGET}
  podman push docker.io/kakinari/ubi-micro-ja:10-graal-${TARGET}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-graal-${TARGET}
else
  podman build --network=host --build-arg TARGET="${VERSION}-graal" -t docker.io/kakinari/ubi-micro-ja:10-graal-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-graal-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-graal-${VERSION}
