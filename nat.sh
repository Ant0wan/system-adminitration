# Masquerading
#  enable IP forwarding
# /etc/sysctl.conf or /etc/sysctl.d/99-sysctl.conf
#  net.ipv4.ip_forward=1
#  net.ipv6.conf.all.forwarding=1
sudo sysctl --system
sudo sysctl --all | grep forward
# nft or iptables
ip route list default
# iptables chains
sudo iptables -t nat -A PREROUTING -i enp1s0 -s 10.0.0.0/24 -p tcp --dport 8080 -j DNAT --to-destination 192.168.0.5:80
sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o enp1s0 -j MASQUERADE
sudo nft list ruleset
sudo apt install iptables-persistent
sudo iptables netfilter-persistent save
man ufw-framework    # exemple section contains iptables examples
sudo iptables --list-rules --table nat
sudo iptables --flush --table nat
