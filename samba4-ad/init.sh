#!/bin/bash

if [ $DOCKER_DEBUG = 1 ]; then
  uname -a
  set
  hostname
fi

sed -i "/^DNS2=/d" /etc/sysconfig/network-scripts/ifcfg-ens3
echo DNS2=$DNS_FORWARD >> /etc/sysconfig/network-scripts/ifcfg-ens3

echo search $DNS_DOMAIN> /etc/resolv.conf
echo nameserver 127.0.0.1>> /etc/resolv.conf
echo nameserver $DNS_FORWARD>> /etc/resolv.conf

if [ $DOCKER_DEBUG = "1" ]; then
  cat /etc/sysconfig/network-scripts/ifcfg-ens3
  cat /etc/resolv.conf
fi
