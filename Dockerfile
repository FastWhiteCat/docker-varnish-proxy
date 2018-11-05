FROM nginx:1.10.1

EXPOSE 80

COPY conf.d /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
CMD mkdir /var/www/html/health
COPY index.html /var/www/html/health/index.html

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["usr/local/bin/start.sh"]
