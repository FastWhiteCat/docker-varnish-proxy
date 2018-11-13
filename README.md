# Container with Proxy for Varnish in AWS

[![Docker Stars](https://img.shields.io/docker/stars/fastwhitecat/varnish.svg)](https://hub.docker.com/r/fastwhitecat/varnish-proxy/)
[![Docker Pulls](https://img.shields.io/docker/pulls/fastwhitecat/varnish.svg)](https://hub.docker.com/r/fastwhitecat/varnish-proxy/)

Included:

- Nginx 1.10.1

## Quick Start

Run:

```bash
docker run -Pit --name=varnish-proxy fastwhitecat/varnish
```
Run with configuration:

```bash
docker run -Pit --name=varnish \
        -e LISTEN_PORT="80" \
        -e ELB_DNS="http://elb-host:8080" \
        -e NGINX_KEEPALIVE_TIMEOUT="65" \
        -e NGINX_WORKER_CONNECTIONS="1024" \
        -e RESOLVER_IP="8.8.8.8" \
        -e RESOLVER_TIme="600s" fastwhitecat/varnish-proxy
```

Build:

```bash

docker build -t varnish .

```
