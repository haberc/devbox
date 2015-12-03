#install nginx

if [ ! -f /usr/local/sbin/nginx ] ; then
    pkg install -y nginx
fi

if [ ! -d /usr/local/etc/nginx/conf.d ] ; then
    mkdir -p /usr/local/etc/nginx/conf.d
fi

if ! grep -Fxq 'nginx_enable="YES"' /etc/rc.conf ; then
    echo 'nginx_enable="YES"' >> /etc/rc.conf
    service nginx start
fi

nginx_conf=$(cat <<EOF 

worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;

    keepalive_timeout  65;

    gzip  on;

    include /usr/local/etc/nginx/conf.d/*.conf;
}
EOF
)

nginx_conf_path=/usr/local/etc/nginx/nginx.conf
if [ ! -f $nginx_conf_path ] ; then
    echo -e "$nginx_conf" > $nginx_conf_path;
    service nginx restart
fi

