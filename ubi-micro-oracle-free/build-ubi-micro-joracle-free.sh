#!/bin/bash
VERSION=23ai

podman build -v $PWD:/root -t docker.io/kakinari/ubi-micro-ja:9-oracle-free-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-oracle-free-latest docker.io/kakinari/ubi-micro-ja:9-oracle-free-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-oracle-free-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-oracle-free-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-oracle-free-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-oracle-free-${VERSION}
