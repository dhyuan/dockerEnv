#!/bin/bash

docker network rm nginx-net 
docker network create --subnet=172.50.0.0/16 nginx-net
