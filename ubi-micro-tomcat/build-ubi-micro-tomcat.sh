#!/bin/bash

podman build -t docker.io/kakinari/ubi-micro-ja:9-22-tomcat10 .
podman push docker.io/kakinari/ubi-micro-ja:9-22-tomcat10
podman image rm docker.io/kakinari/ubi-micro-ja:9-22-tomcat10
podman image rm docker.io/kakinari/ubi-micro-ja:9-java22-dev
podman image rm docker.io/kakinari/ubi-micro-ja:9-jre22
podman image rm docker.io/kakinari/ubi-micro-ja:9 -f
podman system prune -f
