#!/bin/bash

[ -z "$LISTEN_PORT" ] &&  export LISTEN_PORT="80"
[ -z "$ELB_DNS" ] &&      export ELB_DNS=""

[ -z "$SITEMAP_URL" ] &&       export SITEMAP_URL="http://localhost/"
[ -z "$SITEMAP_BLOG_URL" ] &&  export SITEMAP_BLOG_URL="http://localhost/"
[ -z "$SITEMAP_INDEX" ] &&     export SITEMAP_INDEX="sitemap_index.xml"
[ -z "$SITEMAP_CATEGORY" ] &&  export SITEMAP_CATEGORY="sitemap_category.xml"
[ -z "$SITEMAP_PRODUCTS" ] &&  export SITEMAP_PRODUCTS="sitemap_products.xml"
[ -z "$SITEMAP_BLOG" ] &&      export SITEMAP_BLOG="blog_sitemap.xml"

[ -z "$NGINX_KEEPALIVE_TIMEOUT" ] &&  export NGINX_KEEPALIVE_TIMEOUT="65"
[ -z "$NGINX_WORKER_CONNECTIONS" ] && export NGINX_WORKER_CONNECTIONS="1024"

[ -z "$RESOLVER_IP" ] &&    export RESOLVER_IP="8.8.8.8"
[ -z "$RESOLVER_TIME" ] &&  export RESOLVER_TIME="600s"

[ -z "$PROXY_BUFFER_SIZE" ] &&       export PROXY_BUFFER_SIZE="128k"
[ -z "$PROXY_BUFFERS_NUMBER" ] &&    export PROXY_BUFFERS_NUMBER="4"
[ -z "$PROXY_BUFFERS_SIZE" ] &&      export PROXY_BUFFERS_SIZE="256k"
[ -z "$PROXY_BUSY_BUFFERS_SIZE" ] && export PROXY_BUSY_BUFFERS_SIZE="256k"

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

sed -i 's=__resolver_ip__='"$RESOLVER_IP"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__resolver_time__='"$RESOLVER_TIME"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__proxy_buffer_size__='"$PROXY_BUFFER_SIZE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__proxy_buffers_number__='"$PROXY_BUFFERS_NUMBER"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__proxy_buffers_size__='"$PROXY_BUFFERS_SIZE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__proxy_busy_buffers_size__='"$PROXY_BUSY_BUFFERS_SIZE"'=g' /etc/nginx/conf.d/default.conf


nginx -g 'daemon off;'
