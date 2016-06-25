#!/bin/sh
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update -y
sudo apt-get install python-software-properties
sudo apt-get update -y
#PHP, Apache
sudo apt-get install apache2 apache2-doc apache2-utils libapache2-mod-php5 -y
sudo apt-get install php5 php5-fpm php5-cli php5-mysql php5-sybase php5-common -y
sudo apt-get install php5-gd php5-mcrypt php5-memcache  php5-odbc -y
sudo apt-get install php5-xdebug php5-xcache php5-curl php-pear -y
#PHPUnit
sudo wget https://phar.phpunit.de/phpunit.phar
sudo chmod +x phpunit.phar
sudo sudo mv phpunit.phar /usr/local/bin/phpunit
#MySQL 5.5
#Credenciais Mysql
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.6
#Composer Install
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
#Optimize Apache
sudo a2enmod dav_fs
#Habilitar .htaccess no projeto PHP
sudo a2enmod rewrite
