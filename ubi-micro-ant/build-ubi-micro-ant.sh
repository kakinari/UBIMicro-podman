#!/usr/bin/bash
LATEST=1.10.17
VERSION=${1:-latest}

if [ "$VERSION" = "latest" ]; then
  podman build --net=host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-ant-${VERSION} .
  podman tag docker.io/kakinari/ubi-micro-ja:10-ant-${VERSION} docker.io/kakinari/ubi-micro-ja:10-ant-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-ant-${LATEST}
  podman image rm docker.io/kakinari/ubi-micro-ja:10-ant-${LATEST}
else
  podman build --net=host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-ant-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-ant-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-ant-${VERSION}
