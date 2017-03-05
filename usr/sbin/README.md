#asdf

#Files
##motionPhone.sh

Annotation: the file needs to executable

starts or stops the motion service, if a certain device is available or not.

to do this, you need to create a cronjob as sudo. this example will run every 2 minutes

$ sudo crontab -e

and add the line

*/2 * * * * /usr/sbin/motionPhone.sh >/dev/null 2>&1

annotation: basically, stopping the service is ok, if you use only one cam. but this could lead to problems using more than one cam. use case: one cam inside your home, one cam outside. if the service stops, both cams wont work. anyway the web interface is unavailable then. maybe disable cam itself.... looks like to make some fork, but due to some urgent circumstances, it does what it should do....
