podman run -ti --rm --name eclipse -e DISPLAY -v .:/root -v /tmp/.X11-unix:/tmp/.X11-unix docker.io/kakinari/ubi-micro-ja:10-eclipse-latest $*
