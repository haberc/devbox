# -*- mode: ruby -*-
# vi: set ft=ruby :

name = 'devbox-freebsd'
hostname = 'freebsd.dev'

Vagrant.configure("2") do |config|
  config.vm.guest = :freebsd
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", nfs: true
  config.vm.box = "freebsd/FreeBSD-10.2-RELEASE"
  config.ssh.shell = "sh"
  config.vm.base_mac = "080027D14C66"

  config.vm.hostname = hostname

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", name]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
  end

  config.ssh.forward_agent = true

  if Vagrant.has_plugin? 'vagrant-dns'
    # Configure vagrant-dns plugin
    config.dns.tld = "dev"
    config.dns.patterns = Regexp.new("^.*#{hostname}$")
    # @end: Configure vagrant-dns plugin
  elsif Vagrant.has_plugin? 'vagrant-hostmaster'
    config.vm.host_name = hostname
    config.hosts.aliases = [
      #"www.#{hostname}",
      #"couchdb.#{hostname}",
      #"es.#{hostname}"
    ]
  end

  if Vagrant.has_plugin? 'vagrant-auto_network'
    # The Vagrant auto_network plugin will find a free IP for you
    config.vm.network :private_network, auto_network: true
  else
    config.vm.network "private_network", ip: "33.33.0.10"
  end

  # basic packages, you should run those on every box
  config.vm.provision "shell", path: "provisioners/shell/base.sh"
  config.vm.provision "shell", path: "provisioners/shell/git.sh"
  config.vm.provision "shell", path: "provisioners/shell/ssh.sh"

  # nginx is not "optional" since it's used as a proxy for things like couchdb, elasticsearch, etc.
  config.vm.provision "shell", path: "provisioners/shell/nginx.sh"

  # optional features, uncomment those you need
  #config.vm.provision "shell", path: "provisioners/shell/nodejs.sh"
  #config.vm.provision "shell", path: "provisioners/shell/ruby.sh"
  #config.vm.provision "shell", path: "provisioners/shell/php.sh"
  #config.vm.provision "shell", path: "provisioners/shell/mongodb.sh"
  #config.vm.provision "shell", path: "provisioners/shell/couchdb.sh", args: "#{hostname}"
  #config.vm.provision "shell", path: "provisioners/shell/elasticsearch.sh", args: "#{hostname}"
  #config.vm.provision "shell", path: "provisioners/shell/redis.sh"
end
