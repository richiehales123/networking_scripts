# Scripts For Networking Tasks

## Gateway VM
1. Create a VM with additional network card - Rich's net.
2. Use IP address on VM net - [scp](https://www.computerhope.com/unix/scp.htm) `gatewaysetup.sh` to `/usr/local/bin/gatewaysetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/gatewaysetup.sh`.
4. Run script - `/usr/local/bin/gatewaysetup.sh`.

## DHCP VM
1. Create a VM and connect - Rich's net.
2. Create a temporary IP `192.168.10.10` - [scp](https://www.computerhope.com/unix/scp.htm) `dhcpsetup.sh` to `/usr/local/bin/dhcpsetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/dhcpsetup.sh`.
4. Run script - `/usr/local/bin/dhcpsetup.sh`.

## DNS VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.computerhope.com/unix/scp.htm) `dnssetup.sh` to `/usr/local/bin/dnssetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/dnssetup.sh`.
4. Run script - `/usr/local/bin/dnssetup.sh`.

## App A VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.computerhope.com/unix/scp.htm) `appasetup.sh` to `/usr/local/bin/appasetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/appasetup.sh`.
4. Run script - `/usr/local/bin/appasetup.sh`.

## App B VM
1. Create a VM and connect - Rich's net.
2. Use IP address assigned by the DHCP server - [scp](https://www.computerhope.com/unix/scp.htm) `appbsetup.sh` to `/usr/local/bin/appbsetup.sh`.
3. Change privileges - `chmod +x /usr/local/bin/appbsetup.sh`.
4. Run script - `/usr/local/bin/appbsetup.sh`.

## App B will call App A and return a JSON file from the TARGET_URL

