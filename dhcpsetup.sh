#!/bin/bash


# Set IP address and gateway with nmcli
nmcli connection modify ens33 ipv4.addresses 192.168.10.2/24 ipv4.gateway 192.168.10.1 ipv4.method manual

# Restart the ens33 connection to apply changes
nmcli connection down ens33
nmcli connection up ens33


# Install dhcp-server
# -y flag to proceed without user input
yum install -y dhcp-server


# Setup dhcpd.conf file
echo 'ddns-update-style none;
authoritative;
subnet 192.168.10.0 netmask 255.255.255.0 {
  range 192.168.10.50 192.168.10.200;
  option domain-name-servers 192.168.10.3, 8.8.8.8;
  option routers 192.168.10.1;
  option broadcast-address 192.168.10.255;
}' > /etc/dhcp/dhcpd.conf


# Start and enable dhcp to start on boot up
systemctl enable dhcpd
systemctl start dhcpd


# Allow dhcp traffic through firewall
firewall-cmd --zone=public --add-service=dhcp --permanent
firewall-cmd --reload








