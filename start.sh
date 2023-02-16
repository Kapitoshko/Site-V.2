#!/bin/bash
# By Dimokus (https://t.me/Dimokus)
source $HOME/.bashrc
TZ=Europe/Kiev
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt-get update
apt-get upgrade -y
apt-get install -y sudo nano wget tar zip unzip jq ssh nginx git
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
service nginx start
sleep 5
rm /var/www/html/index.nginx-debian.html
cd /var/www/html/
git clone https://github.com/Kapitoshko/Site-V.2 .
