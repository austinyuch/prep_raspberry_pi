#!/bin/bash
# https://devdojo.com/bobbyiliev/how-to-install-docker-and-docker-compose-on-raspberry-pi

echo "Install docker-compose "

sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip

sudo pip3 install docker-compose

