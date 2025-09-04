#/usr!/bin/bash
VERSION=10.1.43
COMMON=1.4.1

podman build --build-arg VERSION=${VERSION} --build-arg COMMON=${COMMON} -t docker.io/kakinari/ubi-micro-ja:9-tomcat-latest .
podman tag  docker.io/kakinari/ubi-micro-ja:9-tomcat-latest docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION}
podman push docker.io/kakinari/ubi-micro-ja:9-tomcat-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-tomcat-latest
podman image rm docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION}
