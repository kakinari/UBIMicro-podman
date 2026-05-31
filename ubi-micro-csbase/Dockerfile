FROM registry.redhat.io/ubi10-init:latest
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm -y
RUN dnf install langpacks-ja glibc-langpack-ja langpacks-fonts-ja -y
RUN dnf less curl wget container-tools podman-docker xauth openssl openssh -y
RUN LANG=C dnf groupinstall "Development Tools" -y
RUN dnf clean all -y
ENV container=podman
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV TZ=JST-9
CMD [ "/usr/bin/bash" ]
WORKDIR /root
