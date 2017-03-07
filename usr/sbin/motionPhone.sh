#!/bin/bash

#found here: https://github.com/ccrisan/motioneye/issues/203

phone_ip="192.168.0.101"

#check for phone
phone_present=0

ping -c 1 $phone_ip &>/dev/null && phone_present=1

if systemctl -q is-active motioneye.service ; then
  # service is up
  if [[ $phone_present -eq 1 ]] ; then
    # someone is home, stop service
    #systemctl stop motioneye.service
    # instead of stopping the service, unbind cam
     echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/unbind  > /dev/null 2>&1
  fi
else
  # service is down
  if [[ $phone_present -eq 0 ]] ; then
    # phone not available, start service
    #systemctl start motioneye.service
    # bind cam
    echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/bind  > /dev/null 2>&1 
  fi
fi
