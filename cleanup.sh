
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-ruby-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-sdkman
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-nvm
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jdev-17
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-dev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase-nx
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase-nx-17
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase-17
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-base
podman image rm -f docker.io/kakinari/ubi-micro-ja:9
podman image rm -f registry.access.redhat.com/ubi9/ubi-init:latest
podman system prune -f
podman images
