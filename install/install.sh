#bin/bash

#vars
$INSTALL="/tmp"  # installation folder

cd $INSTALL
sudo apt-get update & sudo apt-get -y upgrade

mkdir install
cd install
wget https://raw.githubusercontent.com/manuel-baumgartner/pi-CLI-only/master/install/plex.sh
./plex.sh
