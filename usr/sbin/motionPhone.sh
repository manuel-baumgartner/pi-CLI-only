#!/bin/bash

# ips that will be pinged
ips=("192.168.0.100" "192.168.0.101") 

present=0

for ip in "${ips[@]}"
do
    ping -c 1 $ip & > /dev/null && present=1
done

if [[ $present -eq 1 ]] ; then
     # unbind cam
     echo '1-1.5:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/unbind  > /dev/null 2>&1
fi

if [[ $present -eq 0 ]] ; then
    # bind cam
    echo '1-1.5:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/bind  > /dev/null 2>&1 
fi
