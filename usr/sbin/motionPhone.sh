
#!/bin/bash

# ip that will be pinged
phone_ip="192.168.0.101"

phone_present=0

ping -c 1 $phone_ip &>/dev/null && phone_present=1

if [[ $phone_present -eq 1 ]] ; then
     # unbind cam
     echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/unbind  > /dev/null 2>&1
fi

if [[ $phone_present -eq 0 ]] ; then
    # bind cam
    echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/bind  > /dev/null 2>&1 
fi
