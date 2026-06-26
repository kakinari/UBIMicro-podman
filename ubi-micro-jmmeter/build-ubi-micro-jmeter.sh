#!/bin/bash
VERSION=${1:-latest}
LATEST=5.6.3

if [ "${VERSION}" = "latest" ]; then
  podman build --network=host --build-arg VERSION=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION} docker.io/kakinari/ubi-micro-ja:10-jmeter-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-jmeter-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jmeter-${LATEST}

else
    podman build --network=host --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION} .  
fi
podman push docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION}
