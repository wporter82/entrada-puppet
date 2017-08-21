# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "ubuntu/xenial64"
	config.vm.box = "puppetlabs/debian-8.2-64-puppet"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true
  
  config.vm.provision "shell" do |shell|
	  shell.inline = "mkdir -p /etc/puppet/modules;
					  puppet module install -i /etc/puppet/modules puppetlabs/mysql;
					  puppet module install -i /etc/puppet/modules puppetlabs/vcsrepo"
  end

  config.vm.provision "puppet" do |puppet|
	  puppet.environment_path = "environments"
	  puppet.environment = "development"
	  puppet.module_path = "modules"
	  # puppet.options = "--verbose --debug"
  end
end
