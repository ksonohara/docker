FROM centos:7.2.1511
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="CentOS 4 7.2.1511" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="20161215"

# for Japanease
#RUN yum -y reinstall glibc-common
#RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

#ENV LANG ja_JP.UTF-8
#RUN rm -f /etc/localtime
#RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN echo include_only=.jp >> /etc/yum/pluginconf.d/fastestmirror.conf

RUN systemctl disable firewalld

#RUN yum install -y epel-release
#RUN yum clean all

RUN yum update -y

RUN yum install -y authconfig gnutls nettle trousers cups-libs avahi-libs || true
RUN yum install -y krb5-workstation || true
RUN yum install -y yum-plugin-priorities wget || true

RUN yum clean all

RUN mkdir /.docker

ENV DOCKER_DEBUG 0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
