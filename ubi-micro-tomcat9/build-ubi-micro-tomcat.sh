#/usr!/bin/bash
VERSION=9.0.107
COMMON=1.4.1

podman build --build-arg VERSION=${VERSION} --build-arg COMMON=${COMMON} -t docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION} .
podman push docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION}
podman image rm docker.io/kakinari/ubi-micro-ja:9-tomcat-${VERSION}
