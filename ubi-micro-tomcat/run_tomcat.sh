podman run -d --rm --privileged --name tomcat -p 127.0.0.1:8080:8080  docker.io/kakinari/ubi-micro-ja:9-tomcat-latest
# podman run -d --rm --privileged --name tomcat -p 8080:8080  docker.io/kakinari/ubi-micro-ja:9-tomcat-latest
podman ps -a
