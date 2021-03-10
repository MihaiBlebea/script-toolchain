#!/bin/bash

# add new user
# sudo adduser mihai
sudo adduser mihai sudo
sudo adduser mihai adm

# update and upgrade dependencies
sudo apt-get update && sudo apt-get upgrade

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# create docker group and add user to group
sudo groupadd docker
sudo usermod -aG docker mihai

# install git
sudo apt install git-all

# install nginx
sudo apt install nginx
sudo /etc/init.d/nginx start

# install caprover
docker run -p 80:80 \ 
    -p 443:443 \
    -p 3000:3000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /captain:/captain \
    -e MAIN_NODE_IP_ADDRESS='127.0.0.1' \
    caprover/caprover

# http://192.168.1.13:3000/
