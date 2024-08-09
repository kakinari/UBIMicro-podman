podman run -ti --rm --privileged  --name jekyll --net=host  -p 4000:4000 docker.io/kakinari/ubi-micro-ja:9-jekyll-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-jekyll-latest -f
