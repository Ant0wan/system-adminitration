systemctl reboot --force --force
systemctl poweroff --force
sudo shutdown 02:00|+15 --reboot 'Message to warn users'|lolcat

systemctl get-default
sudo systemctl set-default multi-user.target
#sudo systemctl isolate (graphical|emergency|rescue|multi-user).target
sudo systemctl isolate multi-user.target

# Configure boot loader:
    sudo systemctl isolate rescue.target
    chroot /mnt/sysroot
    grub2-mkconfig --output /boot/grub2/grub.cfg   <- if legacy
    grub2-mkconfig --output /boot/efi/EFI/$(uname --nodename)/grub.cfg  <- if EFI

lsblk
lsblk -o NAME,FSTYPE,MOUNTPOINT

# On grub:
grub2-install /dev/sda |lolcat
# On EFI:
dnf reinstall grub2-efi grub2-efi-modules shim
sudo vim /etc/default/grubi
grub2-mkconfig --output /boot/grub2/grub.cfg
cat /etc/default/grub

date
# shebang #!/bin/sh
help
# systemctl start|stop|restart|reload|status|reload-or-restart|disable|enable --now unit.service
systemctl enable --now sshd.service
# systemctl mask|unmask unit.service
systemctl mask sshd.service
systemctl list-units --type service --all
systemctl list-units --type service --all --no-pager
ls /lib/systemd/system
cat sshd.service
touch /etc/systemd/system/myapp.service; sudo systemctl daemon-reload
man systemd.*
man systemd.unit
systemctl show --property MainPID --value sshd

ps u -U antoine
pgrep -a bash
top

lsof -p 1
sudo lsof /var/log/firewalld

kill -L
jobs

# su OR sudo --login
ls /var/log/
grep -r 'ssh' /var/log/
less /var/log/secure
less /var/log/messages
journalctl /bin/sudo    # OR journalctl /bin/myapp
journalctl --unit sshd.service
journalctl --pager-end
journalctl --follow
# journalctl --priority info|warning|err|crit|.....
journalctl --priority warning
journalctl --priority --grep '^p'
journalctl --since 01:00 --until 02:00
journalctl --since '2023-11-08 12:04:34'
journalctl --boot -1
sudo mkdir /var/log/journal/
last
lastlog

cat /etc/crontab/
# match all possible value: *
# match multiple values: 15,45
# match range of values 2-4
# specifies steps */4 <- devide the hour or day or... by 4 i.e. every 4
crontab -e
sudo crontab -l
crontab -l
crontab -r
# sudo crontab -e|-l -u jane
sudo crontab -l -u jane

cat /etc/anacrontab
# no file extension
# daily = /etc/cron.daily
# hourly = /etc/cron.hourly
# monthly = /etc/cron.monthly
# weekly = /etc/cron.weekly
cat /etc/anacrontab
anacron -T
at 15:00
at '2:30 August 20 2024
at 'now + 3 months'
atq
at -c 20
# at -c JOBNUMBER
# atrm JOBNUMBER
atd
sudo cat /var/log/cron

rpm --query --list gcc

cat /etc/security/limits.conf
# john hard  nproc 10
# @developers soft nproc 20
# * soft cpu 5
ulimit -a
ulimit -u 5000
