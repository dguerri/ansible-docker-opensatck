FROM ubuntu:14.04
MAINTAINER Davide Guerri <davide.guerri@gmail.com>

# install packages
RUN set -x \
    && echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu trusty-updates/kilo main" > /etc/apt/sources.list.d/kilo.list \
    && apt-get -y update \
    && apt-get -y install ubuntu-cloud-keyring \
    && apt-get -y update \
    && apt-get -y install \
        mysql-client \
        keystone \
        python-keystoneclient \
        python-mysqldb \
    && apt-get -y clean \
    && rm -f /var/lib/keystone/keystone.db

VOLUME /etc/keystone

EXPOSE 5000 35357

COPY keystone.conf /etc/keystone/keystone.conf

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh && chmod a+x /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
