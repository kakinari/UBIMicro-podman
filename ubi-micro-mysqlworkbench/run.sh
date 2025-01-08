podman run -ti --rm --name meld -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix docker.io/kakinari/ubi-micro-ja:9-meld-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-meld-latest
