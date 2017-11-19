FROM centos:7.4.1708
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="CentOS 7.4.1708" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="20171119" \
      build-tag="1.0.0_4" \
      build-version="3"

# for Japanease
#RUN yum -y reinstall glibc-common
#RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

#ENV LANG ja_JP.UTF-8
#RUN rm -f /etc/localtime
#RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

#RUN echo include_only=.jp >> /etc/yum/pluginconf.d/fastestmirror.conf

RUN yum install -y epel-release
RUN yum install -y yum-plugin-priorities wget unzip curl || true

RUN yum update -y || true

RUN yum clean all

RUN mkdir /.docker

ENV DOCKER_DEBUG 0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
