sudo dnf install squid
sudo systemctl enable --now squid
sudo firewall-cmd --add-service=squid
sudo firewall-cmd --runtime-to-permanent
sudo cat /etc/squid/squid.conf
#acl localnet src 10.11.12.0/8
#acl external src 203.0.113.0/24
#http_access deny !Safe_ports         # rule enforcing above described rules
#http_access deny to_localhost        # do not access http services on squid server
#acl youtube dstdomain .youtube.com
#http_access deny youtube
#http_access allow localnet !youtube  # trigger both rules instead of 1 line by line
sudo systemctl reload squid.service   # not interrupting current sessions
sudo ystemctl restart squid.service   # to interrupt the current active sessions
