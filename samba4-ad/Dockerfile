FROM centos:7.2.1511
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="Samba 4 AD/DC" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="20161215"

ENV DOCKER_DEBUG 0
ENV DNS_FORWARD 8.8.8.8
ENV DNS_DOMAIN test.local
ENV AD_PASSWORD noPassw0rd!
ENV AD_REALM test.local
ENV AD_DOMAIN test
ENV AD_NOSTRONGAUTH 1

# for Japanease
#RUN yum -y reinstall glibc-common
#RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

#ENV LANG ja_JP.UTF-8
#RUN rm -f /etc/localtime
#RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#RUN echo include_only=.jp >> /etc/yum/pluginconf.d/fastestmirror.conf

RUN systemctl disable firewalld

RUN yum clean all

RUN yum install -y epel-release

RUN yum clean all

RUN yum update -y

RUN yum clean all

RUN yum install -y authconfig gnutls nettle trousers cups-libs avahi-libs || true
RUN yum install -y krb5-workstation || true
RUN yum install -y yum-plugin-priorities wget || true

RUN yum clean all

RUN wget http://wing-net.ddo.jp/wing/7/EL7.wing.repo \
    && sed -i 's@enabled=0@enabled=1@g' EL7.wing.repo \
    && mv EL7.wing.repo /etc/yum.repos.d/

RUN yum install -y samba45 samba45-clients ldb-tools samba45-winbind-clients samba45-winbind || true

RUN yum clean all

RUN samba-tool --help

RUN sed -i 's@PEERDNS=yes@PEERDNS=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN sed -i 's@IPV6_PEERDNS=yes@IPV6_PEERDNS=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN sed -i 's@IPV6_AUTOCONF=yes@IPV6_AUTOCONF=no@g' /etc/sysconfig/network-scripts/ifcfg-ens3
RUN echo DNS1=127.0.0.1 >> /etc/sysconfig/network-scripts/ifcfg-ens3

RUN cat /etc/sysconfig/network-scripts/ifcfg-ens3

RUN rm -f /etc/samba/smb.conf

RUN mkdir /.docker

VOLUME ["/var/lib/samba", "/var/log/samba", "/etc/samba", "/.docker"]

EXPOSE 53 135 137/udp 138/udp 139 389 445 464 636

COPY config.txt /.docker/config
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY init.sh /.docker/init.sh
COPY setup.sh /.docker/setup.sh
COPY service.sh /.docker/service.sh
RUN chmod +x /.docker
RUN chmod +x /.docker/*.sh

ENTRYPOINT ["/entrypoint.sh"]
