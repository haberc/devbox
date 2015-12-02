#install redis

if [ ! -f /usr/local/bin/redis ] ; then
    pkg install -y redis
fi

if ! grep -Fxq 'redis_enable="YES"' /etc/rc.conf ; then
    echo 'redis_enable="YES"' >> /etc/rc.conf
    service redis start
fi
