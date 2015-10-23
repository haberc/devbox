=begin
required vagrant plugins:
- vagrant-dns
- vagrant-bindfs
=end

require "yaml"
require "ostruct"

options = OpenStruct.new(YAML.load(File.read "vagrant_options.yml"))

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = options.hostname

  # configure DNS to resolve the VM's hostname
  if Vagrant.has_plugin? 'vagrant-dns'
    config.dns.tld = "dev";
    config.dns.patterns = [Regexp.new("^.*#{options.hostname}\.dev$")]
  end

  # configure network interfaces
  config.vm.network "private_network", ip: options.ip

  # configure SSH connectivity
  config.ssh.forward_agent = true
  config.ssh.insert_key = true
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--name", options.name]
    v.cpus = 2
    v.memory = 1024
  end

  # mount the project dir inside the VM
  config.vm.synced_folder options.project_dir, "/project_nfs", type: "nfs"
  # re-bind the mounted dir with corrected ownership (fixes a vagrant/NFS issue)
  config.bindfs.bind_folder "/project_nfs", "/project"

  # set port forwardings from config file
  options.forwarded_ports.each do |name, forward|
    config.vm.network "forwarded_port", guest: forward['guest'], host: forward['host'], auto_correct: true
  end

  # update APT repos
  config.vm.provision :shell, :path => "./scripts/apt-update.sh"

  # run Puppet provisioning
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path     = "."
    puppet.manifest_file      = "puppet.pp"
    puppet.module_path        = "./modules"
    puppet.options = "--verbose --debug"
  end
end
