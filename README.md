# FreeBSD devbox

This is a vagrant/virtualbox setup for a FreeBSD development machine based on the official FreeBSD vagrant images:

<https://atlas.hashicorp.com/freebsd/boxes/FreeBSD-10.2-RELEASE>

# Requirements

This setup requires the [vagrant-dns plugin](https://github.com/BerlinVagrant/vagrant-dns) for hostname resolution.

The [vagrant-auto_network plugin](https://github.com/oscar-stack/vagrant-auto_network) is also recommended, but not required.

# Usage

## Initial Setup

```sh
git clone git@github.com:lnwdr/devbox.git
cd devbox
vagrant up
```

On the first boot, the SSH connection may take some time to establish and vagrant will complain about timeouts. Don't worry, just wait. After the first time, booting will be much faster.

## Additional services

Open the Vagrantfile and uncomment the services you want in the last section of the file.

After that run `vagrant provision` to apply the changes to the machine.

# Details

## Packages

This setup mostly installs binary packages from FreeBSD's "latest" repository. If you want even more recent versions or can't find something in the packages, use the ports system. The ports tree is already automatically iniitalised and ready to use.

## Nginx

This machine runs Nginx by default. It is used as a reverse proxy for other HTTP speaking
services in the box, like Elasticsearch or CouchDB for example.

You can also use Nginx to host your own project. For that, add another provisioning script that
generates an Nginx conf file. See the [Nginx section of the CouchDB provisioning script](https://github.com/lnwdr/devbox/blob/master/provisioners/shell/couchdb.sh#L13-L30) for reference.

Remember to call the provisioning script with the 'hostname' argument from the Vagrantfile so the script can use the
global value for the hostname:

```ruby
config.vm.provision "shell", path: "provisioners/shell/couchdb.sh", args: "#{hostname}"
```

All Nginx sites should use their own subdomain. The CouchDB proxy for example runs on `http://couchdb.freebsd.dev`.
