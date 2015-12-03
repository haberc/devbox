#install couchdb

if [ ! -f /usr/local/bin/couchdb ] ; then
    pkg install -y couchdb
fi

if ! grep -Fxq 'couchdb_enable="YES"' /etc/rc.conf ; then
    echo 'couchdb_enable="YES"' >> /etc/rc.conf
    service couchdb start
fi


hostname=$1
nginx_site_conf=$(cat <<EOF 
server {
    listen 80;
    server_name couchdb.$hostname;
    location / {
        proxy_pass http://localhost:5984;
    }
}
EOF
)

nginx_site_path=/usr/local/etc/nginx/conf.d/couchdb.conf

if [ ! -f $nginx_site_path ] ; then
    echo -e "$nginx_site_conf" > $nginx_site_path;
    service nginx restart
fi

