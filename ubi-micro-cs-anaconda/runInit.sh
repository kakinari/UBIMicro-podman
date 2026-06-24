podman run -d --rm --device nvidia.com/gpu=all --name python --network host -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  docker.io/kakinari/ubi-micro-ja:10-cs-anaconda-3 /sbin/init
