#!/bin/sh
#Configurações do repositório
sudo apt-get update -y && sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y && sudo apt-get upgrade -y
#Apache 2.2
sudo apt-get install apache2 apache2-doc apache2-utils libapache2-mod-php5.6 -y
#PHP 5.6
sudo apt-get install php5.6 -y
sudo apt-get install php5.6-fpm php5.6-cli php5.6-mysql php5.6-sybase php5.6-common php5.6-soap php5.6-mcrypt php5.6-json php5.6-curl php5.6-gd php5.6-mbstring php5.6-opcache php5.6-xml php5.6-zip -y
sudo apt-get install php5.6-xmlrpc php5.6-pgsql php5.6-xsl -y
sudo apt-get install php5-xdebug -y
#PHPUnit
sudo wget https://phar.phpunit.de/phpunit.phar
sudo chmod +x phpunit.phar
sudo sudo mv phpunit.phar /usr/local/bin/phpunit
#MySQL 5.6
#Credenciais Mysql
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.6
#Set configuration
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost'"
sudo echo "USE mysql;\nUPDATE user SET password=PASSWORD('root') WHERE user='root';\nFLUSH PRIVILEGES;\n" | mysql -u root
#Composer Install
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
#Optimize Apache
sudo a2enmod dav_fs
#Habilitar .htaccess no projeto PHP
sudo a2enmod rewrite
#Configurações apache
sudo sed -i "s/Directory \/var\/www\/html/Directory \/vagrant/g" /etc/apache2/apache2.conf
sudo sed -i "s/Directory \/var\/www/Directory \/vagrant/g" /etc/apache2/apache2.conf
sudo sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
sudo sed -i "s/\/var\/www\/html/\/vagrant/g" /etc/apache2/sites-enabled/000-default.conf
sudo sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/my.cnf
sudo sed -i "s/text size = 64512/text size = 20971520/g" /etc/freetds/freetds.conf
sudo sed -i "s/tds version = 4.2/tds version = 8.0/g" /etc/freetds/freetds.conf
sudo sed -i '$ a ServerName "AlmondegaServer_0_1_1"' /etc/apache2/sites-enabled/000-default.conf
#Apache restart
sudo service apache2 restart



