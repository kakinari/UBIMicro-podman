#!/usr/bin/bash
VERSION=8.8

podman build --build-arg=VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-22-gradle-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-22-gradle-latest docker.io/kakinari/ubi-micro-ja:9-22-gradle-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-22-gradle-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-22-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-22-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-22-gradle-${VERSION}
