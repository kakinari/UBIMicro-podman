#!/usr/bin/bash
VERSION=22.4.1

podman build --build-arg=VERSION=22 -t docker.io/kakinari/ubi-micro-ja:9-node-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-node-latest docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-node-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-node-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
