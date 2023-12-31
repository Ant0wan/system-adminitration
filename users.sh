sudo useradd john   # create user and group john and /home/john and default /bin/bash
ls -a /etc/skel    # copy pasted in /home/john
useradd --defaults
cat /etc/login.defs
sudo passwd john
sudo userdel john
sudo userdel --remove john
sudo useradd --shell /bin/sh --home-dir /home/john2/ john
cat /etc/passwd
sudo useradd --uid 1100 smith
ls -ln /home/
id
whoami
sudo useradd --system sysacc   # id value <= 999
sudo usermod --home /home/other --move-home john
sudo usermod --login jane john
sudo usermod --shell /bin/zsh jane
sudo usermod --lock|--unlock jane
sudo usermod --expiredate 2012-12-10 jane
sudo usermod --expiredate "" jane
sudo chage --lastday 0 jane
sudo chage --lastday -1 jane
sudo chage --maxdays 30 jane
sudo chage --maxdays -1 jane
sudo chage --list jane
sudo userdel john
sudo groupdel john
sudo -iu john
sudo gpasswd --add trinity wheel  # Gives privileges
sudo visudo   # %wheel ALL=(ALL)   ALL
# %user/group  HOST=(RUNAS)   PORTFIELD
# user/group host=(run_as_user) command_list
# Root Account
sudo --login  # login as root
su --login   # or su or su -l
sudo passwd root
sudo passwd --unlock root
sudo passwd --lock root
