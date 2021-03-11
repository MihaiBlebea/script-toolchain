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

# set static ip
# https://thepihut.com/blogs/raspberry-pi-tutorials/how-to-give-your-raspberry-pi-a-static-ip-address-update

"interface wlan0

static ip_address=192.168.0.200/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1" >> /etc/dhcpcd.conf

# restart the raspi
sudo reboot now