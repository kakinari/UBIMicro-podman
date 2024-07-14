#!/bin/bash
VERSION=4.3.3
podman build -t docker.io/kakinari/ubi-micro-ja:9-jekyll-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-jekyll-latest docker.io/kakinari/ubi-micro-ja:9-jekyll-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jekyll-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-jekyll-latest
podman image rm -f localhost/kakinari/ubi-micro-ja:9-jekyll-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jekyll-${VERSION}
