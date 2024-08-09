#!/usr/bin/bash

podman login docker.io

(cd ubi-micro-9; ./build-ubi-micro-ja.sh)
(cd ubi-micro-base; ./build-ubi-micro-base.sh)
(cd ubi-micro-jbase; ./build-ubi-micro-jbase.sh)
(cd ubi-micro-jbase-nx; ./build-ubi-micro-jbase-nx.sh)
(cd ubi-micro-dev; ./build-ubi-micro-dev.sh)
(cd ubi-micro-jdev; ./build-ubi-micro-jdev.sh)

(cd ubi-micro-sdkman; ./build-ubi-micro-sdkman.sh)
(cd ubi-micro-nvm; ./build-ubi-micro-nvm.sh)

(cd ubi-micro-ant; ./build-ubi-micro-ant.sh)
(cd ubi-micro-gradle; ./build-ubi-micro-gradle.sh)
(cd ubi-micro-maven; ./build-ubi-micro-maven.sh)
(cd ubi-micro-graal; ./build-ubi-micro-graal.sh)

(cd ubi-micro-ruby; ./build-ubi-micro-ruby.sh)
(cd ubi-micro-jekyll; ./build-ubi-micro-jekyll.sh)
(cd ubi-micro-node; ./build-ubi-micro-node.sh)

(cd ubi-micro-meld; ./build-ubi-micro-meld.sh)
(cd ubi-micro-jmmeter; ./build-ubi-micro-jmeter.sh)
(cd ubi-micro-tomcat; ./build-ubi-micro-tomcat.sh)

(cd ubi-micro-postgres; ./build-ubi-micro-postgres.sh)
(cd ubi-micro-weblogic; ./build-ubi-micro-weblogic.sh)
(cd ubi-micro-mysql; .//build-ubi-micro-mysql-server.sh)
./cleanup.sh
