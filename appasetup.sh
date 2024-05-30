#!/bin/bash

# Set IP address and gateway with nmcli
nmcli connection modify ens33 ipv4.addresses 192.168.10.5/24 ipv4.gateway 192.168.10.1 ipv4.method manual



# Restart the ens33 connection to apply changes
nmcli connection down ens33
nmcli connection up ens33

echo 'nameserver 192.168.10.3
nameserver 8.8.8.8' >> /etc/resolv.conf

echo 'DNS1=192.168.10.3
DNS2=8.8.8.8
PEERDNS=no' >> /etc/sysconfig/network-scripts/ifcfg-ens33

# Reset Network Manager after changes:
systemctl restart NetworkManager


# Install Git
yum -y install git

# Clone git repo using personal access key
git clone https://<*******Personal Key*****>@github.com/Enterprise-Automation/<repository>.git 

# Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install node js
source ~/.nvm/nvm.sh
nvm install 20

# Install dotenv:
npm install dotenv

# Firewall settings (open 3000 for tcp - PORT env variable below for calls from 192.1.1.1:3000):		
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload 

# Set environment variables and check values:
export PORT=3000
export TARGET_URL=https://jsonplaceholder.typicode.com/posts

# Start app:
cd trainee-challenge-node-app
npm install
npm start
