# Scripts For Networking Tasks

## Gateway VM
1. Create a vm with additional network card - Rich's net
2. Copy gateway_script - scp to /usr/local/bin/gateway.sh
3. Change privilages - chmod +x /usr/local/bin/gateway.sh
4. Run script - /usr/local/bin/dhcpsetup.sh

## DHCP VM
1. Create a vm and connect - Rich's net
2. Create a temporary IP 192.168.10.10 to scp - dhcp_script.sh
3. Change privilages - chmod +x /usr/local/bin/dhcpsetup.sh
4. Run script - /usr/local/bin/dhcpsetup.sh

## DNS VM
1. Create a vm and connect - Rich's net
2. scp to IP address assigned by DHCP Server - dns_script.sh
3. Change privilages - chmod +x /usr/local/bin/dnssetup.sh
4. Run script - /usr/local/bin/dnssetup.sh

## App A VM
1. Create a vm and connect - Rich's net
2. scp to IP address assigned by DHCP Server - appa_script.sh
3. Change privilages - chmod +x /usr/local/bin/appasetup.sh
4. Run script - /usr/local/bin/appasetup.sh
