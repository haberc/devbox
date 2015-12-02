#install mongodb

if [ ! -f /usr/local/bin/mongod ] ; then
    pkg install -y mongodb
fi

if ! grep -Fxq 'mongod_enable="YES"' /etc/rc.conf ; then
    echo 'mongod_enable="YES"' >> /etc/rc.conf
    service mongod start
fi
