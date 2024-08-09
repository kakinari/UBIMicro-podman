#!/usr/bin/bash
VERSION=22.0.2

podman build --build-arg=VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-graal-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-graal-latest docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-graal-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-graal-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-graal-${VERSION}
