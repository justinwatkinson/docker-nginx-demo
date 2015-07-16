FROM alpine

MAINTAINER justinwatkinson justin.watkinson@gmail.com

RUN apk --update add nginx

ADD index.html /usr/share/nginx/html/index.html
ADD nginx-init.sh /usr/local/bin/nginx-init.sh
RUN chmod +x /usr/local/bin/nginx-init.sh

#Let's it run in the foreground and can be seen in STDIN
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 7071

ENTRYPOINT /usr/local/bin/nginx-init.sh
