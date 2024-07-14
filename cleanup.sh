
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-ruby-latest
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-sdkman
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-nvm
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-dev
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase-nx
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-jbase
podman image rm -f docker.io/kakinari/ubi-micro-ja:9-base
podman image rm -f docker.io/kakinari/ubi-micro-ja:9
podman system prune -f
podman images
