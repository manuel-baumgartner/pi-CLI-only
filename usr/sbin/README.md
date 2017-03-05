#asdf

#Files
##motionPhone.sh

Annotation: the file needs to executable

starts or stops the motion service, if a certain device is available or not.

to do this, you need to create a cronjob as sudo. this example will run every 5 minutes

$ sudo crontab -e

and add the line

*/5 * * * * /usr/sbin/motionPhone.sh >/dev/null 2>&1
