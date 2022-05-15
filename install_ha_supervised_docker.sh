#!/bin/bash
# https://community.home-assistant.io/t/install-supervised-supervisor-on-raspberry-pi4-with-docker-installation/291186/27

# HA supervised installer
# https://github.com/home-assistant/supervised-installer
# HA os-agent https://github.com/home-assistant/os-agent/tree/main#using-home-assistant-supervised-on-debian
# Install needed Home Assistant Supervised dependencies
# Step 1: Install the following dependacy's with this command:
#這個會把IP改掉
sudo apt install \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
apparmor \
python3-apparmor \
apparmor-utils \
network-manager \
dbus -y

# Step 2: Install Docker-CE with the following command:
# Docker可以先裝好
# curl -fsSL get.docker.com | sh
# Step 3: Install the OS-Agent:
# it allows the Home Assistant Supervisor to communicate with the host operating system.
# goto https://github.com/home-assistant/os-agent/releases/latest

# wget https://github.com/home-assistant/os-agent/releases/download/1.2.2/os-agent_1.2.2_linux_aarch64.deb
# sudo dpkg -i os-agent_1.2.2_linux_aarch64.deb

# Step 4: Install the Home Assisistant Supervised Debian Package:
wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
sudo dpkg -i homeassistant-supervised.deb
