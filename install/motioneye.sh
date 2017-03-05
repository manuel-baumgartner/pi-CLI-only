#!/bin/bash
cd /tmp

# ffmpeg if not installed
wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
dpkg -i ffmpeg_3.1.1-1_armhf.deb

sudo apt-get remove libavcodec-extra-56 libavformat56 libavresample2 libavutil54

# install dependencies
sudo apt-get install python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5

# install motion
wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb
dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb

# install motion eye
sudo pip install motioneye

# directories, configs and services
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

mkdir -p /var/lib/motioneye

sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye

sudo pip install motioneye --upgrade
sudo systemctl restart motioneye

echo "you may open a webbrowser now and type: <pi-ip-address>:8765"
echo "the default login without password is: admin"
