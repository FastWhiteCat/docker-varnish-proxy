#!/bin/bash

if [ -z "$LISTEN_PORT" ]; then
    LISTEN_PORT="80"
fi

if [ -z "$ELB_DNS" ]; then
    ELB_DNS=""
fi

sed -i 's=__listen_port__='"$LISTEN_PORT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__elb_dns__='"$ELB_DNS"'=g' /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
