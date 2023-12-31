ip link
ip --color address
sudo ip link set dev eth1 up
sudo ip address add 192.168.5.55/24 dev eth1  # not permanent
sudo ip address delete 192.168.5.55/24 dev eth1  # not permanent
sudo ip address add fe80::5054:ff:fe1f:8050/64 dev eth1  # not permanent
sudo ip address delete fe80::5054:ff:fe1f:8050/64 dev eth1  # not permanent

netplan get
ls /etc/netplan/
cat /etc/netplan/00-installer-config.yaml
sudo netplan try --timeout 30
sudo netplan apply
ip link
cat /etc/netplan/99-mysettings.yaml
resolvectl status
cat /etc/systemd.resolved.conf
# DNS=1.1.1.1,9.9.9.9
resolvectl dns
cat /etc/host
# 127.0.123.123 dbserver
man netplan
ls /usr/share/doc/netplan/examples/
cat /usr/share/doc/netplan/examples/dhcp.yaml
cat /usr/share/doc/netplan/examples/static.yaml

ss   # socket statistics
netstat
sudo ss --listening --tcp --udp --numeric --processes  # ss -ltunp
netstat -ltunp

# Bridge - network devices == ports and bridge == controller
# Bond/Bonding Mode
#  mode 0 : Round Robin
#  mode 1 : Active - passive
#  mode 2 : Balance XOR
#  mode 3 : Broadcast
#  mode 4 : IEEE 802.3ad
#  mode 5 : balance-tlb  adaptative transmit load balancing
#  mode 6 : balance-alb  adaptative load balancing
cat /usr/share/doc/netplan/examples/bridge.yaml
cat /usr/share/doc/netplan/examples/bonding.yaml
