#! /bin/bash
sudo apt-get -y install nfs-common
sudo echo "Domain = 192.168.4.5" >>   /etc/idmapd.conf
sudo mount -t nfs 192.168.4.5:/home /home 
df -hT 
sudo echo "192.168.4.5:/home   /home  nfs     defaults        0       0" >>  /etc/fstab
sudo apt-get -y install autofs
sudo echo "/-    /etc/auto.mount" >>  /etc/auto.master
mkdir /mntdir 
systemctl restart autofs



