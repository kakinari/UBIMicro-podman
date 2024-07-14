podman run -ti --rm --name jekyll  -p 4000:4000 --privileged  docker.io/kakinari/ubi-micro-ja:9-jekyll-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-jekyll-latest -f
