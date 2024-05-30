#!/bin/bash

# Create ifcfg file for the 2nd network card
sudo echo 'DEVICE=ens35
BOOTPROTO=static
HWADDR=00:50:56:90:bc:4a
IPADDR=192.168.10.1
BROADCAST=192.168.10.255
NETMASK=255.255.255.0
NETWORK=192.168.10.0
ONBOOT=yes
TYPE=Ethernet
USERCTL=no
IPV6INIT=no
PEERDNS=no' > /etc/sysconfig/network-scripts/ifcfg-ens35


# Enable IP forwarding
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/99-sysctl.conf

# Apply changes
sudo sysctl --system


# Add NAT rule
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --reload



# Restart NetworkManager
sudo systemctl restart NetworkManager