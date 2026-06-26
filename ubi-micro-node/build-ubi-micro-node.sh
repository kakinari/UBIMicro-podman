#!/usr/bin/bash
VERSION=${1:-latest}
LATEST=24
if [ "$VERSION" = "latest" ]; then
  podman build --network=host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-node-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-node-${VERSION} docker.io/kakinari/ubi-micro-ja:10-node-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-node-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-node-${LATEST}
else
  podman build --network=host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-node-${VERSION} .
fi 
podman push docker.io/kakinari/ubi-micro-ja:10-node-${VERSION}
podman image rm docker.io/kakinari/ubi-micro-ja:10-node-${VERSION}

