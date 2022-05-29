#!/bin/bash

NGINX_DOCKER_NAMES=("nginxA" "nginxB" "nginxC")

for ((i=0; i<${#NGINX_DOCKER_NAMES[@]}; i++))
do 
  NAME=${NGINX_DOCKER_NAMES[i]}

  docker exec $NAME /usr/sbin/nginx -s reload
  echo "$NAME reloaded"
done
