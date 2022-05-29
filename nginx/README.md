

### 1) Create network 'nginx-net' wiht CIDR 172.50.0.0/16

    ./createNetwork.sh

### 2) Run the Nginx containers 'nginxA', 'nginxB', 'nginxC' up.
The contains are bind to fixed IP addresses in nginx-net.

    ./startNginx.sh

You can install the curl for the containers.

    docker exec -it nginxA sh
    apt-get update
    apt-get install iputils-ping

### 3) Run up an alpine container as the client to 'curl' in nginx-net.

    docker run --name nclient100 --network nginx-net --ip 172.50.0.100 -it alpine:3.16.0

Install curl for the alpine container.

    apk add curl

Test with different head from the client side.

    curl http://nginxA:9090/testProxy/index.html
    curl -H "X-FORWARDED-FOR: 12.3.4.5"  http://nginxA:9090/testProxy/index.html


### 4) Change the __"location /testProxy"__ block in nginxA(B|C)/config/confd/9090.conf to play around.

### 5) How show containers' IP.

    ./showInfo.sh

### 6) clean the containers' access.log and error.log

    ./cleanlog.sh

### 7) verify / reload the nginx configuration.

    ./testCfg.sh
    ./reload.sh
