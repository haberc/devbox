# Configure SSH

# create .ssh dir
# add known hosts for github and bitbucket

if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi

# Create .ssh directory for vagrant if it doesn't exist
if [ ! -d "/home/vagrant/.ssh" ]; then
    mkdir -p /home/vagrant/.ssh
fi

if [ ! -f "/home/vagrant/.ssh/known_hosts" ]; then
    touch ~/.ssh/known_hosts
    ssh-keygen -R bitbucket.org
    ssh-keyscan -t rsa -H bitbucket.org >> ~/.ssh/known_hosts

    ssh-keygen -R github.com
    ssh-keyscan -t rsa -H github.com >> ~/.ssh/known_hosts

    cp ~/.ssh/known_hosts /home/vagrant/.ssh/known_hosts

    # Own file by the vagrant user and adjust permissions
    chown vagrant:vagrant /home/vagrant/.ssh/known_hosts && \
        chmod 0600 /home/vagrant/.ssh/known_hosts
fi
