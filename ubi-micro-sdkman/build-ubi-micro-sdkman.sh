#!/usr/bin/bash

podman build --network host -t docker.io/kakinari/ubi-micro-ja:10-sdkman .
podman push docker.io/kakinari/ubi-micro-ja:10-sdkman
