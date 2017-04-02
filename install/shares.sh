#!bin/bash

# nfs
sudo apt-get install nfs-kernel-server
# nfs fix
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/etc/systemd/system/nfs-common.services
cp nfs-common.services /etc/system/systemd
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/etc/systemd/system/rpcbind.service
cp rpcbind.service /etc/systemd/system

# samba
sudo apt-get install samba
