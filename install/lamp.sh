#!/bin/bash
sudo apt-get -y install apache2 php5 libapache2-mod-php5 
sudo service apache2 restart
sudo apt-get -y install mysql-server mysql-client php5-mysql
sudo apt-get -y install phpmyadmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo service apache2 reload
