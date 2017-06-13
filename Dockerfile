FROM nginx:1.10.1

EXPOSE 80

RUN apt-get update \
  && apt-get install -y \
    vim \
    wget \
  && apt-get clean

ADD nginx.conf /etc/nginx/nginx.conf

ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["usr/local/bin/start.sh"]
