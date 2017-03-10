#bin/bash

#vars
$INSTALL=/tmp  # installation folder

cd INSTALL
sudo apt-get update & sudo apt-get -y upgrade

mkdir install
cd install

sudo su

# enable ssh
touch /boot/ssh

# disable bluetooth and wifi
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/etc/modprobe.d/raspi-blacklist.conf
cp raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist.conf

# plex
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/install/plex.sh
chmod +x plex.sh
./plex.sh

# motioneye
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/install/motioneye.sh
chmod +x motioneye.sh
./motioneye.sh

reboot
