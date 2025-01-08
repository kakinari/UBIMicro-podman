podman run -d --rm --name init -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix docker.io/kakinari/ubi-micro-ja:9-init /sbin/init
