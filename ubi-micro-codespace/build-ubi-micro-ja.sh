#!/bin/bash

podman build -t docker.io/kakinari/ubi-micro-ja:9-codespace .
podman push docker.io/kakinari/ubi-micro-ja:9-codespace
podman image rm docker.io/kakinari/ubi-micro-ja:9-codespace
podman image rm docker.io/redhat/ubi9-init
