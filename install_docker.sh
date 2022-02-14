#!/bin/bash
# https://phoenixnap.com/kb/docker-on-raspberry-pi

sudo apt update && sudo apt upgrade -y

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker $USER

sudo usermod -aG docker pi

