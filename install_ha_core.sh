#!/bin/bash
# https://lazyadmin.nl/home-network/install-home-assistant-raspberry-pi/
# https://www.home-assistant.io/installation/raspberrypi/
echo "Installing Home Assistant Core.... "
sudo apt update && sudo apt upgrade -y
echo "Installing basic environment..."
sudo apt-get install -y python3 python3-dev python3-venv python3-pip libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0 tzdata
echo "Creating ha admin"
sudo useradd -rm homeassistant -G dialout,gpio,i2c

echo "Create VM"
sudo mkdir /srv/homeassistant
sudo chown homeassistant:homeassistant /srv/homeassistant

sudo -u homeassistant -H -s
cd /srv/homeassistant

python3.9 -m venv .
source bin/activate

echo "VM created!"

echo $PWD

python3 -m pip install wheel

pip3 install homeassistant

# Start Home Assistant Core for the first time. 
# This will complete the installation for you, automatically creating the 
# .homeassistant configuration directory in the /home/homeassistant directory,
# and installing any basic dependencies.

hass

echo "Installed Home Assistant Core"
