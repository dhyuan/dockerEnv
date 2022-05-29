#!/bin/bash

NGINX_DOCKER_NAMES=("nginxA" "nginxB" "nginxC")

for ((i=0; i<${#NGINX_DOCKER_NAMES[@]}; i++))
do 
  NAME=${NGINX_DOCKER_NAMES[i]}

  echo "verify the config of $NAME"
  docker exec $NAME /usr/sbin/nginx -t
  echo ""
  
done
