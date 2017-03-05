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
    systemctl stop motioneye.service
  fi
else
  # service is down
  if [[ $phone_present -eq 0 ]] ; then
    # phone not available, start service
    systemctl start motioneye.service
  fi
fi