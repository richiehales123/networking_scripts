#!/bin/bash

# Set IP address and gateway with nmcli
nmcli connection modify ens33 ipv4.addresses 192.168.10.3/24 ipv4.gateway 192.168.10.1 ipv4.method manual

# Restart the ens33 connection to apply changes
nmcli connection down ens33
nmcli connection up ens33

# Add google to nameserver
echo 'search dev.easlab.co.uk
nameserver 8.8.8.8' > /etc/resolv.conf

# Install bind
# -y flag to proceed without user input
yum install -y bind bind-utils


# Start bind - start automatically - check status:
systemctl enable named
systemctl start named


# Write new named.conf settings to named.conf
echo 'options {
    directory "/var/named";
    dump-file "/var/named/data/cache_dump.db";
    statistics-file "/var/named/data/named_stats.txt";
    memstatistics-file "/var/named/data/named_mem_stats.txt";
    secroots-file   "/var/named/data/named.secroots";
    recursing-file  "/var/named/data/named.recursing";
    allow-query     { localhost;192.168.10.0/24; };

    recursion yes;

    dnssec-enable yes;
    dnssec-validation yes;

    managed-keys-directory "/var/named/dynamic";

    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";

    /* https://fedoraproject.org/wiki/Changes/CryptoPolicy */
    include "/etc/crypto-policies/back-ends/bind.config";
};

logging {
    channel default_debug {
        file "data/named.run";
        severity dynamic;
    };
};

zone "richie.local" IN {
    type master;
    file "fwd.richie.local.db";
    allow-update { none; };
};      

zone "." IN {
    type hint;
    file "named.ca";
};

include "/etc/named.rfc1912.zones";
include "/etc/named.root.key";' > /etc/named.conf


# Create a file to search name and return ip address
echo '$TTL 86400
@ IN SOA primary.richie.local. root.richie.local. (
2016042112 ;Serial
3600 ;Refresh
1800 ;Retry
604800 ;Expire
43200 ;Minimum TTL
)
;Name Server Information
@ IN NS primary.richie.local.
;IP address of Name Server
primary IN A 192.168.10.3
www IN A 192.168.10.1
;CNAME record
ftp IN CNAME www.richie.local.
appa IN A 192.168.10.5
appb IN A 192.168.10.6' > /var/named/fwd.richie.local.db


# Restart Bind
systemctl restart named


# Configure firewall settings
firewall-cmd --permanent --add-port=53/udp
firewall-cmd --reload
