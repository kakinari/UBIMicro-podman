#!/usr/bin/bash
TARGET=8.14

podman build --build-arg TARGET=${TARGET} -t docker.io/kakinari/ubi-micro-ja:9-gradle-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-gradle-latest docker.io/kakinari/ubi-micro-ja:9-gradle-${TARGET}
podman push docker.io/kakinari/ubi-micro-ja:9-gradle-${TARGET}
podman push docker.io/kakinari/ubi-micro-ja:9-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-gradle-${TARGET}
