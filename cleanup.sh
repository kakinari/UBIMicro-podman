
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-cs-anaconda-3 
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-cs-java-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-cs-nodejs
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-csbase

podman image rm -f docker.io/kakinari/ubi-micro-ja:10-sdkman
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-nvm-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-dev
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jbase-nx
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jbase
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-base
podman image rm -f docker.io/kakinari/ubi-micro-ja:10
podman image rm -f registry.access.redhat.com/ubi10/ubi-init:latest
podman system prune -f
podman images
