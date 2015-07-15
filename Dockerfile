FROM ubuntu:14.04.2

MAINTAINER justinwatkinson justin.watkinson@gmail.com

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends nginx && \
    apt-get -y autoremove && \
    apt-get -y clean

ADD index.html /usr/share/nginx/html/index.html
ADD nginx-init.sh /usr/local/bin/nginx-init.sh
RUN chmod +x /usr/local/bin/nginx-init.sh

#Let's it run in the foreground and can be seen in STDIN
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

ENTRYPOINT /usr/local/bin/nginx-init.sh
