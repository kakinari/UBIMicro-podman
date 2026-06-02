podman login docker.io
podman login registry.redhat.io
(cd ubi-micro-csbase; bash ./build-ubi-micro-csbase.sh)
(cd ubi-micro-cs-java; bash ./build-ubi-micro-java.sh)
(cd ubi-micro-cs-nodejs; bash ./build-ubi-micro-nodejs.sh)
(cd ubi-micro-cs-anaconda; bash ./build-ubi-micro-anaconda.sh)
