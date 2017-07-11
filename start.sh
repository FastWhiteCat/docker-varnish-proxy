#!/bin/bash

if [ -z "$LISTEN_PORT" ]; then
    LISTEN_PORT="80"
fi

if [ -z "$ELB_DNS" ]; then
    ELB_DNS=""
fi

if [ -z "$SITEMAP_FILENAME" ]; then
    SITEMAP_FILENAME="sitemap.xml"
fi

if [ -z "$SITEMAP_URL" ]; then
    SITEMAP_URL=""
fi

sed -i 's=__listen_port__='"$LISTEN_PORT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__elb_dns__='"$ELB_DNS"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__sitemap_filename__='"$SITEMAP_FILENAME"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_url__='"$SITEMAP_URL"'=g' /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
