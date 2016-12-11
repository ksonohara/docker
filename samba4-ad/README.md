# Summary

Samba 4 ActiveDirectory docker container

# Usage

## Configuration

### --env

    DOCKER_DEBUG 0
    DNS_FORWARD 8.8.8.8
    DNS_DOMAIN test.local
    AD_PASSWORD noPassw0rd!
    AD_REALM test.local
    AD_DOMAIN test

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

    sudo docker run -it -p 389:389 -d sonohara/samba4-ad \
                -e "DOCKER_DEBUG=1" \
                -e "DNS_FORWARD=8.8.8.8" \
                -e "DNS_DOMAIN=test.local" \
                -e "AD_PASSWORD=noPassw0rd!" \
                -e "AD_REALM=test.local" \
                -e "AD_DOMAIN=test"
