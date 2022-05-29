#!/bin/bash

NGINX_DOCKER_NAMES=("nginxA" "nginxB" "nginxC")

for ((i=0; i<${#NGINX_DOCKER_NAMES[@]}; i++))
do 
  NAME=${NGINX_DOCKER_NAMES[i]}
  
  docker stop $NAME

  rm ~/dockerEnv/nginx/$NAME/log/access.log
  rm ~/dockerEnv/nginx/$NAME/log/error.log
  touch ~/dockerEnv/nginx/$NAME/log/access.log
  touch ~/dockerEnv/nginx/$NAME/log/error.log
  
  docker start $NAME
  
  echo "$NAME's log reopened"
done
