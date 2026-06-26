#!/usr/bin/bash
TARGET=${1:-latest}
LATEST=9.6.0

if [ "${TARGET}" = "latest" ]; then
  podman build --network=host --build-arg TARGET=${LATEST} -t docker.io/kakinari/ubi-micro-ja:10-gradle-${TARGET} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-gradle-${TARGET} docker.io/kakinari/ubi-micro-ja:10-gradle-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-gradle-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-gradle-${LATEST}
else
  podman build --network=host --build-arg TARGET=${TARGET} -t docker.io/kakinari/ubi-micro-ja:10-gradle-${TARGET} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-gradle-${TARGET}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-gradle-${TARGET}
