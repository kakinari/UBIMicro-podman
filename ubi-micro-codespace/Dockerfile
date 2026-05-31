FROM registry.redhat.io/ubi10-init:latest
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm -y; \
dnf install glibc-langpack-jai less curl container-tools podman-docker xauth openssl openssh ; \
LANG=C dnf groupinstall "Development Tools" -y; \
dnf remove java-1.8.0-openjdk-headless -y; \
dnf clean all -y; \
curl -s "https://get.sdkman.io" | bash;
ENV SDKMAN_DIR /usr/local/sdkman
ENV container=podman
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV TZ=JST-9
CMD [ "/usr/bin/bash" ]
WORKDIR /root
