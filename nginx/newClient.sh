#!/bin/bash

docker run --name nclient100 --network nginx-net --ip 172.50.0.100 -it alpine:3.16.0