#!/bin/bash

if [ -z "$LISTEN_PORT" ]; then
    LISTEN_PORT="80"
fi

if [ -z "$ELB_DNS" ]; then
    ELB_DNS=""
fi

if [ -z "$SITEMAP_INDEX" ]; then
    SITEMAP_INDEX="sitemap_index.xml"
fi

if [ -z "$SITEMAP_CATEGORY" ]; then
    SITEMAP_CATEGORY="sitemap_category.xml"
fi

if [ -z "$SITEMAP_PRODUCTS" ]; then
    SITEMAP_PRODUCTS="sitemap_products.xml"
fi

if [ -z "$SITEMAP_BLOG" ]; then
    SITEMAP_BLOG="blog_sitemap.xml"
fi

if [ -z "$NGINX_KEEPALIVE_TIMEOUT" ]; then
    NGINX_KEEPALIVE_TIMEOUT="65"
fi

if [ -z "$NGINX_WORKER_CONNECTIONS" ]; then
    NGINX_WORKER_CONNECTIONS="1024"
fi

sed -i 's=__listen_port__='"$LISTEN_PORT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__elb_dns__='"$ELB_DNS"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__sitemap_index__='"$SITEMAP_INDEX"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_category__='"$SITEMAP_CATEGORY"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_products__='"$SITEMAP_PRODUCTS"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_blog__='"$SITEMAP_BLOG"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_url__='"$SITEMAP_URL"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__sitemap_blog_url__='"$SITEMAP_BLOG_URL"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__nginx_keepalive_timeout__='"$NGINX_KEEPALIVE_TIMEOUT"'=g' /etc/nginx/nginx.conf
sed -i 's=__nginx_worker_connections__='"$NGINX_WORKER_CONNECTIONS"'=g' /etc/nginx/nginx.conf

nginx -g 'daemon off;'
