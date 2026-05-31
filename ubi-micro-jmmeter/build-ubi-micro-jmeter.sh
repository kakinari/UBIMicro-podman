#!/bin/bash
VERSION=5.6.3

podman build --build-arg VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:10-jmeter-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:10-jmeter-latest docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:10-jmeter-latest
podman image rm docker.io/kakinari/ubi-micro-ja:10-jmeter-latest
podman image rm docker.io/kakinari/ubi-micro-ja:10-jmeter-${VERSION}
