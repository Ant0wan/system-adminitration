sudo dnf install dovecot
sudo dnf enable --now dovecot
sudo firewall-cmd --add-service=imap
sudo firewall-cmd --add-service=imaps
sudo firewall-cmd --runtime-to-permanent
sudo cat /etc/dovecot/dovecot.conf
#protocols = imap pop3 lmtp submission
#porotcols = imap   #enable imap and imaps
#listen = *, ::
#listen = 10.11.12.9
ls /etc/dovecot/conf.d/
sudo cat /etc/dovecot/conf.d/10-master.conf  # contains service ports
# servive imap-login {
#      port = 993
sudo cat /etc/dovecot/conf.d/10-mail.conf
# mail_location = mbox:~/mail:INBOX=/var/mail/%u
sudo cat /etc/dovecot/conf.d/10-ssl.conf
#ssl = required
#ssl = yes   # allow both imap and imaps
