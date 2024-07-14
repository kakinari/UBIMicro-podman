#!/usr/bin/sh
vers=${1:-9}
name=${2:-micro}
podman run -ti --rm --name $name -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix docker.io/kakinari/ubi-micro-ja:$vers
podman image rm docker.io/kakinari/ubi-micro-ja:$vers -f
