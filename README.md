# Scripts For Networking Tasks

## A task for configuring a gateway to connect public network to a private network. Involves setting up a DHCP server to allocate IP addresses and a DNS server to assign names to App A and AppB IP addresses

## Gateway VM
1. Create a VM with additional network card - Rich's net.
2. Use IP address on VM net - [scp](https://www.redhat.com/sysadmin/secure-file-transfer-scp-sftp) `gatewaysetup.sh` to `/usr/local/bin/gatewaysetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/gatewaysetup.sh`.
4. Run script - `/usr/local/bin/gatewaysetup.sh`.

## DHCP VM
1. Create a VM and connect - Rich's net.
2. Create a temporary IP `192.168.10.10` - [scp](https://www.redhat.com/sysadmin/secure-file-transfer-scp-sftp) `dhcpsetup.sh` to `/usr/local/bin/dhcpsetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/dhcpsetup.sh`.
4. Run script - `/usr/local/bin/dhcpsetup.sh`.

## DNS VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.redhat.com/sysadmin/secure-file-transfer-scp-sftp) `dnssetup.sh` to `/usr/local/bin/dnssetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/dnssetup.sh`.
4. Run script - `/usr/local/bin/dnssetup.sh`.

## App A VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.redhat.com/sysadmin/secure-file-transfer-scp-sftp) `appasetup.sh` to `/usr/local/bin/appasetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/appasetup.sh`.
4. Run script - `/usr/local/bin/appasetup.sh`.

## App B VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.redhat.com/sysadmin/secure-file-transfer-scp-sftp) `appbsetup.sh` to `/usr/local/bin/appbsetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/appbsetup.sh`.
4. Run script - `/usr/local/bin/appbsetup.sh`.

## App B will call App A and return a JSON file from the TARGET_URL
