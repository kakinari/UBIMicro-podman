#!/usr/bin/bash
podman exec tomcat /bin/sh -c "/opt/tomcat/bin/daemon.sh stop"
podman ps -a
