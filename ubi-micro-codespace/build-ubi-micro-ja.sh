#!/bin/bash

podman build -t docker.io/kakinari/ubi-micro-ja:10-codespace .
podman push docker.io/kakinari/ubi-micro-ja:10-codespace
podman image rm docker.io/kakinari/ubi-micro-ja:10-codespace
podman image rm docker.io/redhat/ubi10-init
