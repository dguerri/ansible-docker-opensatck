FROM phusion/baseimage
MAINTAINER Davide Guerri davide.guerri@gmail.com

RUN set -x \
    && echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu trusty-updates/kilo main" > /etc/apt/sources.list.d/kilo.list \
    && apt-get -y update \
    && apt-get -y install ubuntu-cloud-keyring \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install python \
    && apt-get -y clean

# Remove start and stop dummy commands
RUN rm -f /sbin/start && rm -f /sbin/stop
