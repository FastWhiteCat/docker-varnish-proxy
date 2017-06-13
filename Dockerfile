FROM nginx:1.10.1

RUN apt-get update && \
    apt-get install -y \
    curl

EXPOSE 80

ADD nginx.conf /etc/nginx/nginx.conf

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["usr/local/bin/start.sh"]
