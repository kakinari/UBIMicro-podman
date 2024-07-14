#!/bin/bash
VERSION=3.3.4

podman build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-ruby-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-ruby-latest docker.io/kakinari/ubi-micro-ja:9-ruby-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-ruby-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-ruby-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-ruby-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-ruby-${VERSION}
