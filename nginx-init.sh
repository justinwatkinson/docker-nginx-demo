#!/bin/bash
sed -i "s/<%CONTAINER_HOSTNAME%>/$HOSTNAME/g" /usr/share/nginx/html/index.html
nginx
