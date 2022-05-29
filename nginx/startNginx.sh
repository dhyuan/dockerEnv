#!/bin/bash

# docker network rm nginx-net 
# docker network create --subnet=172.50.0.0/16 nginx-net

NGINX_DOCKER_NAMES=("nginxC" "nginxB" "nginxA")
NGINX_DOCKER_PORTS_MAPPIN=("18082:9090" "18081:9090" "18080:9090")
NGINX_DOCKER_IP=("172.50.0.13" "172.50.0.12" "172.50.0.11")

for ((i=0; i<${#NGINX_DOCKER_NAMES[@]}; i++))
do 
  NAME=${NGINX_DOCKER_NAMES[i]}
  PORT_MAP=${NGINX_DOCKER_PORTS_MAPPIN[i]}
  IP=${NGINX_DOCKER_IP[i]}

  docker stop $NAME; docker rm $NAME

  echo "start nginx docker $NAME $PORT_MAP "
  STASRT_NGINX="docker run --name $NAME \
    --network nginx-net --ip $IP \
    -v ~/dockerEnv/nginx/$NAME/html:/usr/share/nginx/html:ro \
    -v ~/dockerEnv/nginx/$NAME/config/conf.d:/etc/nginx/conf.d \
    -v ~/dockerEnv/nginx/$NAME/config/nginx.conf:/etc/nginx/nginx.conf:ro \
    -v ~/dockerEnv/nginx/$NAME/log:/var/log/nginx \
    -p $PORT_MAP -d nginx:1.22.0"
  echo $STASRT_NGINX
  eval $STASRT_NGINX
  echo ""
done

## install busybox
# docker stop nclient; docker rm nclient;
# docker run --name nclient99 --network nginx-net --ip 172.50.0.99 -it alpine
# apk add curl
