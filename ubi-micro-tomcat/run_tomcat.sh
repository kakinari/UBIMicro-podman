# podman run -d --rm --privileged --name tomcat -p 8080:8080 docker.io/kakinari/ubi-micro-ja:10-tomcat-latest
podman run -d --rm --privileged --name tomcat --network host docker.io/kakinari/ubi-micro-ja:10-tomcat-latest
podman ps -a
