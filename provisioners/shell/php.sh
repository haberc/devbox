#install php

if [ ! -f /usr/local/bin/php ] ; then
    pkg install -y php56
    pkg install -y php56-phar
    pkg install -y php56-curl
    pkg install -y php56-xml
    pkg install -y php56-mbstring
    pkg install -y php56-opcache
fi

if [ ! -L /usr/local/bin/composer ] ; then
    fetch -o /usr/local/lib/composer.phar https://getcomposer.org/composer.phar
    chmod +x /usr/local/lib/composer.phar
    ln -s /usr/local/lib/composer.phar /usr/local/bin/composer
fi
