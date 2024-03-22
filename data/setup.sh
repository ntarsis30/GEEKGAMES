#!/bin/bash

sudo apt-get update

# Install FTPd service | -y is to accept yes
sudo apt-get install -y vsftpd


# allow FTP connectivity

sudo ufw allow 20/tcp # data channel
sudo ufw allow 21/tcp # control channel


# Change the config to allow anonymous access ## note if you ftp you can login to anonymous
sudo cp /data/our_vsftpd.conf /etc/vsftpd.conf
sudo systemctl restart vstfpd

# create a directory and test file for anonymous FTP to read
sudo mkdir -p /vat/ftp/pub
sudo chown nobody:nogroup /var/ftp/pub
echo "vsftpd test file " | sudo tee /var/pub/test.txt