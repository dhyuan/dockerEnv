#!/bin/bash

NGINX_DOCKER_NAMES=("nginxA" "nginxB" "nginxC")

for ((i=0; i<${#NGINX_DOCKER_NAMES[@]}; i++))
do 
  NAME=${NGINX_DOCKER_NAMES[i]}
  
  IP_ADDR=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME`
  echo "$NAME --> $IP_ADDR"
done


echo "nclient ==>" `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nclient`
echo "nclient99 ==>" `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nclient99`
echo "nclient100 ==>" `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nclient100`