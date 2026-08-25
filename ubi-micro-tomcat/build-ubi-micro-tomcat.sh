#/usr!/bin/bash
VERSION=${1:-latest}
LATEST=11.0.25
COMMON=1.6.1

if [ "${VERSION}" = "latest" ]; then
  podman build --network host --build-arg VERSION=${LATEST} --build-arg COMMON=${COMMON} -t docker.io/kakinari/ubi-micro-ja:10-tomcat-${VERSION} .
  podman tag  docker.io/kakinari/ubi-micro-ja:10-tomcat-${VERSION} docker.io/kakinari/ubi-micro-ja:10-tomcat-${LATEST}
  podman push docker.io/kakinari/ubi-micro-ja:10-tomcat-${LATEST}
  podman image rm -f docker.io/kakinari/ubi-micro-ja:10-tomcat-${LATEST}
else
  podman build --network host --build-arg VERSION=${VERSION} --build-arg COMMON=${COMMON} -t docker.io/kakinari/ubi-micro-ja:10-tomcat-${VERSION} .
fi
podman push docker.io/kakinari/ubi-micro-ja:10-tomcat-${VERSION}
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jdev
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-jbase-nx
podman image rm -f docker.io/kakinari/ubi-micro-ja:10-tomcat-${VERSION}
