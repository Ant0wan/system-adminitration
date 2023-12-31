lxd init
wget https://public-kodekloud-course-assets.s3.amazonaws.com/ldap-server.tar.xz
lxc import ldap-server.tar.xz
lxc start ldap-server
lxc list

# libnss-ldapd
sudo apt update && sudo apt install libnss-ldapd -y
# Configure nslcd (name service local daemon)
# IP example from lxc list: 240.50.0.218
# Name dc=kodekloud,dc=com
# Services passwd, group, shadow

sudo cat /etc/nsswitch.conf
# passwd:   files systemd ldap
sudo cat /etc/nslcd.conf
getent passwd
getent passwd --service ldap
getent group --service ldap

sudo pam-auth-update
# [x] Unix Authentication
# [x] LDAP Authentication
# [x] Register user session in the systemd control group hierarchy
# [x] Inheritable Capabilities Management
# [x] Create home directory on login
sudo login john
