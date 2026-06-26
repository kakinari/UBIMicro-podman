podman run -ti --rm --privileged  --name jekyll --net=host  docker.io/kakinari/ubi-micro-ja:9-jekyll-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-jekyll-latest -f
