#bin/bash

#vars
$INSTALL="/tmp"  # installation folder

cd $INSTALL
sudo apt-get update & sudo apt-get -y upgrade

mkdir install
cd install

# plex
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/install/plex.sh
chmod +x plex.sh
./plex.sh

# motioneye
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/install/motioneye.sh
chmod +x motioneye.sh
./motioneye.sh
