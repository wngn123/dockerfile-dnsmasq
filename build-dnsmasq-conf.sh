#!/bin/sh

# DNSMASQ_CONF_DIR=/etc/dnsmasq

CURRENT_DIR=$(dirname "$0")
DNSMASQ_CONF_DIR=$CURRENT_DIR/dnsmasq

echo DNSMASQ_CONF_DIR=$DNSMASQ_CONF_DIR

rm -rf ${DNSMASQ_CONF_DIR}

mkdir -p ${DNSMASQ_CONF_DIR}/conf.d \
 && touch ${DNSMASQ_CONF_DIR}/dnsmasq.conf \
 && echo "conf-dir=/etc/dnsmasq/conf.d" >> ${DNSMASQ_CONF_DIR}/dnsmasq.conf \
 && echo "conf-dir=/etc/dnsmasq/conf.d/,*.conf" >> ${DNSMASQ_CONF_DIR}/dnsmasq.conf \
 && touch ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.address.conf \
 && echo "address=/example.com/10.20.6.199" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.address.conf \
 && touch ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.server.conf \
 && echo "server=8.8.8.8" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.server.conf \
 && echo "server=114.114.114.114" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.server.conf \
 && echo "server=/google.com/8.8.8.8" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.server.conf \
 && echo "server=/cn/114.114.114.114" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.server.conf \
 && touch ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "listen-address=0.0.0.0" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "no-hosts" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "addn-hosts=/etc/dnsmasq/dnsmasq.hosts.conf" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "no-resolv" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "resolv-file=/etc/dnsmasq/dnsmasq.resolv.conf" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "log-queries" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "log-facility=/var/log/dnsmasq.log" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "strict-order" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "all-servers" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "domain-needed" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "cache-size=1024" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && echo "bogus-nxdomain=114.114.114.114" >> ${DNSMASQ_CONF_DIR}/conf.d/dnsmasq.custom.conf \
 && touch ${DNSMASQ_CONF_DIR}/dnsmasq.resolv.conf \
 && echo "# 配置上游DNS，也就是真正的公共DNS" > ${DNSMASQ_CONF_DIR}/dnsmasq.resolv.conf \
 && echo "nameserver 4.4.4.4" >> ${DNSMASQ_CONF_DIR}/dnsmasq.resolv.conf \
 && echo "nameserver 8.8.8.8" >> ${DNSMASQ_CONF_DIR}/dnsmasq.resolv.conf \
 && echo "nameserver 114.114.114.114" >> ${DNSMASQ_CONF_DIR}/dnsmasq.resolv.conf \
 && touch ${DNSMASQ_CONF_DIR}/dnsmasq.hosts.conf \
 && echo "10.20.6.197 test1.corp.example.com" >> ${DNSMASQ_CONF_DIR}/dnsmasq.hosts.conf \
 && echo "10.20.6.198 test2.corp.example.com" >> ${DNSMASQ_CONF_DIR}/dnsmasq.hosts.conf \
 && echo configure success


