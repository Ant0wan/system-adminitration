sudo sysctl --all
sudo sysctl --write net.ipv6.conf.default.disable_ipv6=1
sudo sysctl net.ipv6.conf.default.disable_ipv6
man sysctl.d
echo 'vm.swappiness = 0' > /etc/sysctl.d/no-swap.conf   # make it persistent
sudo sysctl --load /etc/sysctl.d/no-swap.conf
