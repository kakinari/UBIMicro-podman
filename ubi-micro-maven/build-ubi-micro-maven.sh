#!/usr/bin/bash
VERSION=3.9.8

podman build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-maven-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-maven-latest docker.io/kakinari/ubi-micro-ja:9-maven-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-maven-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-maven-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-maven-latest -f
podman image rm docker.io/kakinari/ubi-micro-ja:9-maven-${VERSION} -f
