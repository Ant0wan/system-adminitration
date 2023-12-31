# SeLinux Context:
#  user:role:type:level
ls --context
ps axZ
id -Z
sudo semanage login -l
sudo semanage user -l
getenforce
sestatus

# Setup SELinux on Ubuntu or any Linux
sudo systemctl stop apparmor.service
sudo systemctl disable apparmor.service
sudo apt install selinux-basics auditd -yq
sestatus
sudo selinux-activate
cat /etc/default/grub    # GRUB_CMDLINE_LINUX=" security=selinux"
sudo sysctemctl reboot
getenforce <- if permissive just observing
sudo audit2why --all
ps -eZ
sudo audit2allow --all -M mymodule
sudo semodule -i mymodule.pp
sudo setenforce 1
sudo vi /etc/selinux/config   # SELINUX=enforcing
# Extensions
#  pp: policy package
#  te: type enforcement
cat mymodule.te
sudo chcon -u unconfined_u /var/log/auth.log
sudo chcon -r object_r /var/log/auth.log
sudo chcon -t user_home_t /var/log/auth.log
ls -Z /var/log/auth.log
seinfo -u
seinfo -r
seinfo -t
ls -Z /var/log/ <- copy similar context, use other file as reference
sudo chron --reference=/var/log/syslog /var/log/auth.log
sudo restorecon -R /var/www/
sudo restorecon -R -F /var/www/
sudo semanage fcontext --add --type var_log_t /var/www/file
sudo restorecon /var/www/file
sudo semanage fcontext --file | grep '/var/www/'
sudo semanage fcontext --add --type nfs_t "/nfs/shares(/.*)?"
sudo setsebool virt_use_nfs 1
sudo getsebool virt_use_nfs
sudo semanage port --add --type ssh_port_t --proto tcp 2222
sudo semanage port --delete --type ssh_port_t --proto tcp 2222
