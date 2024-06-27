podman run -ti --rm --name base -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority docker.io/kakinari/ubi-micro-ja:9-jre22
