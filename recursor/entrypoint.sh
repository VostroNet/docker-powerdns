#!/bin/sh

export PORT=${PORT:-"53"}
export FORWARD_ZONES_RECURSE=${FORWARD_ZONES_RECURSE:-".=9.9.9.9,.=149.112.112.112"}
export ALLOW_FROM=${ALLOW_FROM:-"127.0.0.0/8, 10.0.0.0/8, 100.64.0.0/10, 169.254.0.0/16, 192.168.0.0/16, 172.16.0.0/12, ::1/128, fc00::/7, fe80::/10"}

sed -i "s|local-port=5353|local-port=$PORT|g" /etc/pdns/recursor.conf
sed -i "s|# forward-zones-recurse=|forward-zones-recurse=$FORWARD_ZONES_RECURSE|g" /etc/pdns/recursor.conf
sed -i "s|# allow-from=127.0.0.0/8, 10.0.0.0/8, 100.64.0.0/10, 169.254.0.0/16, 192.168.0.0/16, 172.16.0.0/12, ::1/128, fc00::/7, fe80::/10|allow-from=$ALLOW_FROM|g" /etc/pdns/recursor.conf

/usr/sbin/pdns_recursor