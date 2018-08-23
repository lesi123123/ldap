#! /bin/bash
sudo apt-get -y install nfs-kernel-server
sudo echo "Domain = 192.168.4.5" >>   /etc/idmapd.conf
sudo echo "/home 192.168.4.5(rw,no_root_squash)" >>   /etc/idmapd.conf
sudo echo "/home 192.168.4.5(rw,no_root_squash)" >>   /etc/exports
systemctl restart nfs-server
