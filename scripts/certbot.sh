#!/bin/bash

echo "Installing Certbot...."

#Install certbot tool
which certbot &>/dev/null || {
    sudo apt update
    sudo apt install software-properties-common -y
    sudo add-apt-repository universe
    sudo add-apt-repository ppa:certbot/certbot -y
    sudo apt update
    sudo apt install python-certbot-nginx -y
}
