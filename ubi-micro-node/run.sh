podman run -ti --rm --name node -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -p 3000:3000 docker.io/kakinari/ubi-micro-ja:9-node-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-node -f
