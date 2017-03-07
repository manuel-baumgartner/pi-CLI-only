#Files
##motionPhone.sh

Annotation: the file needs to be executable

binds or unbinds a webcam, if a certain device is ping-able or not.

to do this, you need to create a cronjob as sudo. this example will run every 2 minutes
```

$ sudo crontab -e
```
and add the line
```

*/2 * * * * /usr/sbin/motionPhone.sh >/dev/null 2>&1
```
to get the webcam list, you should execute
```

$ ls -l /sys/bus/usb/drivers/uvcvideo/
```
the result is sth. like this
```

lrwxrwxrwx 1 root root    0 Mär  7 21:25 1-1.4:1.0 -> ../../../../devices/platform/soc/3f980000.usb/usb1/1-1/1-1.4/1-1.4:1.0
lrwxrwxrwx 1 root root    0 Mär  7 21:25 1-1.4:1.1 -> ../../../../devices/platform/soc/3f980000.usb/usb1/1-1/1-1.4/1-1.4:1.1
--w------- 1 root root 4096 Mär  7 21:25 bind
lrwxrwxrwx 1 root root    0 Mär  7 21:25 module -> ../../../../module/uvcvideo
-rw-r--r-- 1 root root 4096 Mär  7 21:25 new_id
-rw-r--r-- 1 root root 4096 Mär  7 21:25 remove_id
--w------- 1 root root 4096 Mär  5 22:33 uevent
--w------- 1 root root 4096 Mär  7 21:25 unbind
```
then select your webcam and (un)bind. 
```

$ echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/bind  > /dev/null 2>&1
$ echo '1-1.4:1.0' | sudo tee /sys/bus/usb/drivers/uvcvideo/unbind  > /dev/null 2>&1
```



