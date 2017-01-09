FROM sonohara/centos7-base:latest
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="Samba 4" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="2017015" \
      build-tag="1.0.0_0"

RUN yum install -y authconfig krb5-workstation || true

RUN wget http://wing-net.ddo.jp/wing/7/EL7.wing.repo \
    && sed -i 's@enabled=0@enabled=1@g' EL7.wing.repo \
    && mv EL7.wing.repo /etc/yum.repos.d/

RUN yum install -y samba45 \
                   samba45-winbind-clients samba45-winbind \
                   samba45-client samba45-common-tools samba45-dc samba45-pidl samba45-python \
                   samba45-winbind-krb5-locator perl-Parse-Yapp perl-Test-Base python2-crypto || true

RUN yum clean all | true
