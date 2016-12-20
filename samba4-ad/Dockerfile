FROM sonohara/centos7-base:latest
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="Samba 4 AD/DC" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="20161215"

RUN yum install -y authconfig || true
RUN yum install -y krb5-workstation || true

RUN wget http://wing-net.ddo.jp/wing/7/EL7.wing.repo \
    && sed -i 's@enabled=0@enabled=1@g' EL7.wing.repo \
    && mv EL7.wing.repo /etc/yum.repos.d/

RUN yum install -y samba45 \
                   samba45-winbind-clients samba45-winbind \
                   samba45-client samba45-common-tools samba45-dc samba45-pidl samba45-python \
                   samba45-winbind-krb5-locator perl-Parse-Yapp perl-Test-Base python2-crypto || true

RUN yum clean all

RUN sed -i 's@PEERDNS=yes@PEERDNS=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN sed -i 's@IPV6_PEERDNS=yes@IPV6_PEERDNS=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN sed -i 's@IPV6_AUTOCONF=yes@IPV6_AUTOCONF=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN echo DNS1=127.0.0.1 >> /etc/sysconfig/network-scripts/ifcfg-ens3

RUN cat /etc/sysconfig/network-scripts/ifcfg-ens3

COPY config.txt /.docker/config

COPY init.sh /.docker/init.sh
COPY setup.sh /.docker/setup.sh
COPY service.sh /.docker/service.sh
RUN chmod 755 /.docker
RUN chmod 755 /.docker/*.sh

ENV DNS_FORWARD 8.8.8.8
ENV DNS_DOMAIN sambaad.local
ENV AD_PASSWORD PASS0rd123
ENV AD_REALM $DNS_DOMAIN
ENV AD_DOMAIN SAMBAAD
ENV AD_NOSTRONGAUTH 1

VOLUME ["/var/lib/samba", "/var/log/samba", "/etc/samba", "/.docker"]

EXPOSE 53 135 137/udp 138/udp 139 389 445 464 636

ENTRYPOINT ["/entrypoint.sh"]
