#!/usr/bin/bash
VERSION=1.10.13

podman build --build-arg=VERSION=${VERSION} -t docker.io/kakinari/ubi-micro-ja:9-ant-latest .
podman tag docker.io/kakinari/ubi-micro-ja:9-ant-latest docker.io/kakinari/ubi-micro-ja:9-ant-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-ant-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-ant-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-ant-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-ant-${VERSION}
