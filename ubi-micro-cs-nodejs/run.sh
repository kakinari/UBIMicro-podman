podman run -ti --rm --name base --network host -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  docker.io/kakinari/ubi-micro-ja:10-cs-nodejs-26 bash
