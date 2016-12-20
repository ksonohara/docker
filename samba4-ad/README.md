# Summary

Samba 4 ActiveDirectory docker container.

# Description

Include centos:7 image.

# Usage

## Configuration

### --env

    DOCKER_DEBUG 0
    DNS_FORWARD 8.8.8.8
    DNS_DOMAIN sambaad.local
    AD_PASSWORD PASS0rd123
    AD_REALM sambaad.local
    AD_DOMAIN SAMBAAD
    AD_NOSTRONGAUTH 1

### --port

    53 DNS
    135
    137
    138
    139
    389 LDAP
    445
    464
    636 LDAPS

### --volume

    /var/lib/samba
    /var/log/samba
    /etc/samba
    /.docker

## Examples

### Start Docker Container

    sudo docker run --privileged -it -p 389:389 -d sonohara/samba4-ad \
                -e "DOCKER_DEBUG=1" \
                -e "DNS_FORWARD=8.8.8.8" \
                -e "DNS_DOMAIN=test.local" \
                -e "AD_PASSWORD=noPassw0rd777" \
                -e "AD_REALM=test.local" \
                -e "AD_DOMAIN=test"

# Other

## Copyright and license

- Code released under [GNU GENERAL PUBLIC LICENSE Version 3](https://github.com/ksonohara/docker/blob/master/LICENSE)

## Author

K.Sonohara
- GitHub: https://github.com/ksonohara
- Homepage: [ExpertSoftware Inc.](https://www.e-software.company "ExpertSoftware Inc.")
