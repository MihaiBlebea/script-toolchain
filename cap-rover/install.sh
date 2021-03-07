#!/bin/bash

docker run -p 80:80 \ 
    -p 443:443 \
    -p 3000:3000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /captain:/captain \
    -e MAIN_NODE_IP_ADDRESS='127.0.0.1' \
    caprover/caprover