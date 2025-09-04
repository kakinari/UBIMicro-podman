#!/usr/bin/bash
VERSION=23.11.0

podman build --build-arg VERSION=23 -t docker.io/kakinari/ubi-micro-ja:9-node-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-node-latest docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-node-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-node-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-node-${VERSION}
