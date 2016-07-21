#!/bin/sh
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update -y
sudo apt-get install python-software-properties
sudo apt-get update -y
#PHP, Apache
sudo apt-get install apache2 apache2-doc apache2-utils libapache2-mod-php5 -y
sudo apt-get install php5 php5-fpm php5-cli php5-mysql php5-sybase php5-common php-soap -y
sudo apt-get install php5-gd php5-mcrypt php5-memcache  php5-odbc -y
sudo apt-get install php5-xdebug php5-xcache php5-curl php-pear build-essential php5-memcached memcached -y
sudo apt-get install rabbitmq-server -y
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
#configurações mysql
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost'"
sudo echo "USE mysql;\nUPDATE user SET password=PASSWORD('root') WHERE user='root';\nFLUSH PRIVILEGES;\n" | mysql -u root
#Apache restart
sudo service apache2 restart

#MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

#Configurações do Xdebug
#mkdir /var/log/xdebug
#chown www-data:www-data /var/log/xdebug
#sudo pecl install xdebug
#echo '' &gt;&gt; /etc/php5/apache2/php.ini
#echo ';;;;;;;;;;;;;;;;;;;;;;;;;;' &gt;&gt; /etc/php5/apache2/php.ini
#echo '; Added to enable Xdebug ;' &gt;&gt; /etc/php5/apache2/php.ini
#echo ';;;;;;;;;;;;;;;;;;;;;;;;;;' &gt;&gt; /etc/php5/apache2/php.ini
#echo '' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'zend_extension="'$(find / -name 'xdebug.so' 2&gt; /dev/null)'"' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.default_enable = 1' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.idekey = "vagrant"' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_enable = 1' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_autostart = 0' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_port = 9000' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_handler=dbgp' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_log="/var/log/xdebug/xdebug.log"' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'xdebug.remote_host=10.0.2.2; IDE-Environments IP, from vagrant box.' &gt;&gt; /etc/php5/apache2/php.ini
#echo 'zend_extension="'$(find / -name 'xdebug.so' 2&gt; /dev/null)'"' &gt;&gt; /etc/php5/apache2/php.ini
