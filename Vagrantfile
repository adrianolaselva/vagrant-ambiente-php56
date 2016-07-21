# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
	vb.name = "lajungle_php_56"
  end
  
  config.ssh.insert_key=false
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  
  config.vm.network :forwarded_port, guest: 80, host: 8081, auto_correct: true    	# Apache
  config.vm.network :forwarded_port, guest: 3306, host: 33061, auto_correct: true 	# Mysql
  config.vm.network :forwarded_port, guest: 9000, host: 9000, auto_correct: true 	# XDebug
  config.vm.network :forwarded_port, guest: 5672, host: 56721, auto_correct: true 	# RabbitMQ server
  config.vm.network :forwarded_port, guest: 27017, host: 27018, auto_correct: true 	# MongoDB
  
  config.vm.synced_folder "", "/var/www/html", owner: "root", group: "root"
  config.vm.synced_folder "manifests/etc/apache2/sites-enabled", "/etc/apache2/sites-enabled", owner: "root", group: "root"
  config.vm.synced_folder "manifests/var/apache-solr", "/var/apache-solr", owner: "root", group: "root"
  
  config.vm.provision :shell, :path => "manifests/install.sh"
  
  config.vm.provider "virtualbox" do |v|
	v.memory = 2048
	v.cpus = 2
  end
  
end
