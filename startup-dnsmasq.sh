#!/bin/sh

source /etc/profile

CONTAINER_IP=$(cat /etc/hosts | tail -n 1 | awk '{print $1}')

sed -i "s/listen-address=0.0.0.0/listen-address=127.0.0.1,${CONTAINER_IP}/g" /etc/dnsmasq/conf.d/dnsmasq.custom.conf 

/usr/sbin/dnsmasq -k --conf-file=/etc/dnsmasq/dnsmasq.conf
