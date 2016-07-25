Ambiente de desenvolvimento PHP 5.6.23
=======================


## Pré requisitos para subir ambiente
	
	Vagrant
	VirtualBox

## Instalação

    git clone https://github.com/adrianolaselva/vagrant-ambiente-php56.git
    vagrant up

## Configurações padrão

	portas
		apache  		80 	  => 8081
		ssh 			22 	  => 2222
		mysql			3306  => 33061
		XDebug			3306  => 33061
		rabbitMQ server	5672  => 56721
		MongoDB			27017 => 27018
		
	Pastas sincronizadas
	
	scripts php: / => /vagrant
	scripts php: / => /var/www/html
	conf. virtual apache host: /manifests/etc/apache2/sites-enabled => /etc/apache2/sites-enabled
	logs apache: /manifests/var/log => /var/log
	
## Libs pré instaladas
	
	apache2 
	apache2-doc 
	apache2-utils 
	libapache2-mod-php5
	php5 
	php5-fpm 
	php5-cli 
	php5-mysql 
	php5-sybase 
	php5-common
	php5-gd 
	php5-mcrypt 
	php5-memcache  
	php5-odbc
	php5-xdebug 
	php5-xcache 
	php5-curl 
	php5-mongo
	php-pear
	php-soap
	phpunit
	mysql-server-5.6
	rabbitmq-server
	composer
	mongodb
	
## Módulos apache habilitados

	dav_fs
	rewrite


## Mysql credenciais de acesso

	usuário: root
	senha: root
	