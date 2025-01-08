#!/usr/bin/bash
VERSION=8.11

podman build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-gradle-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-gradle-latest docker.io/kakinari/ubi-micro-ja:9-gradle-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-gradle-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-gradle-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-gradle-${VERSION}
