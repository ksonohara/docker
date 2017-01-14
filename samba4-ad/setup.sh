#!/bin/bash

rm -rf /etc/krb5.conf
rm -rf /etc/samba/smb.conf
rm -rf /var/lib/samba/private/*
rm -rf /var/lib/samba/sysvol/*

samba-tool domain provision \
  --use-rfc2307 \
  --realm=$AD_REALM \
  --domain=$AD_DOMAIN \
  --adminpass=$AD_PASSWORD \
  --server-role=dc \
  --dns-backend=SAMBA_INTERNAL

if [ $AD_NOSTRONGAUTH = 1 ]; then
  sed -i "5a ldap server require strong auth = no" /etc/samba/smb.conf
fi

rm -f /etc/krb5.conf
ln -s /var/lib/samba/private/krb5.conf /etc/krb5.conf

samba-tool domain level show

touch /.docker/setup
