#!/usr/bin/bash

podman build -t docker.io/kakinari/ubi-micro-ja:9-sdkman .
podman push docker.io/kakinari/ubi-micro-ja:9-sdkman
