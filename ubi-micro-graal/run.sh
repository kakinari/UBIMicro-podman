podman run -ti --rm --name base -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix docker.io/kakinari/ubi-micro-ja:9-graal-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-graal-latest -f
