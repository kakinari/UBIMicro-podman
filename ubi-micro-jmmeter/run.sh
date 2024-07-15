#/usr/bin/bash
podman run -ti --rm --name jmeter -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged docker.io/kakinari/ubi-micro-ja:9-jmeter-latest $*
podman image rm docker.io/kakinari/ubi-micro-ja:9-jmeter-latest
