FROM nginx:1.10.1

EXPOSE 80

COPY conf.d /etc/nginx/conf.d/
ADD index.html /var/www/html/index.html

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["usr/local/bin/start.sh"]
