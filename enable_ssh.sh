#!/bin/sh

sudo systemctl enable ssh
sudo systemctl start ssh

echo "To config sshd: sudo raspi-config"