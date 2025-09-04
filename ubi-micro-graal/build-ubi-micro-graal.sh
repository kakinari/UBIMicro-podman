#!/usr/bin/bash
VERSION=24.0.1
TARGET=24.0.1-graal

podman build --build-arg TARGET=${TARGET} -t docker.io/kakinari/ubi-micro-ja:9-graal-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-graal-latest docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-graal-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-graal-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
