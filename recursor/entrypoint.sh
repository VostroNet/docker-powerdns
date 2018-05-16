#!/bin/sh

export PORT=${PORT:-"53"}
export FORWARD_ZONES=${FORWARD_ZONES:-"9.9.9.9,149.112.112.112"}

sed -i "s|local-port=5353|local-port=$PORT|g" /etc/pdns/recursor.conf
sed -i "s|# forward-zones=|forward-zones=$FORWARD_ZONES|g" /etc/pdns/recursor.conf

/usr/sbin/pdns_recursor