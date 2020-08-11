ARG DEBIAN_VERSION=buster

FROM debian:${DEBIAN_VERSION}
LABEL  maintainer "yuuki0xff <yuuki0xff@gmail.com>"
ARG DEBIAN_VERSION=buster

ENV PERCONA_VERSION 3.1
ENV RELEASE_VERSION 3.1-1

RUN apt-get update && apt-get install -y \
      libdbd-mysql-perl \
      libdbi-perl \
      mariadb-client \
      libio-socket-ssl-perl \
      libterm-readkey-perl \
      perl \
      wget \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/* && \
      wget -O percona-toolkit.deb https://www.percona.com/downloads/percona-toolkit/${PERCONA_VERSION}/binary/debian/${DEBIAN_VERSION}/x86_64/percona-toolkit_${RELEASE_VERSION}.${DEBIAN_VERSION}_amd64.deb && \
      dpkg -i percona-toolkit.deb && \
      rm -f percona-toolkit.deb
