#!/bin/bash
podman build -t docker.io/kakinari/ubi-micro-ja:9-22-jmeter .
podman push docker.io/kakinari/ubi-micro-ja:9-22-jmeter
podman image rm docker.io/kakinari/ubi-micro-ja:9-22-jmeter
podman image rm docker.io/kakinari/ubi-micro-ja:9-22-jbase
podman system prune -f
