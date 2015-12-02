# install nodejs

# this will install latest avaiable nodejs, NPM 2 as `npm2` and NPM 3 as `npm`

if [ ! -f /usr/local/bin/node ] ; then
    pkg install -y node
fi

if [ ! -f /usr/local/bin/npm2 ] ; then
    pkg install -y npm
    mv /usr/local/bin/npm /usr/local/bin/npm2
fi

if [ ! -f /usr/local/bin/npm ] ; then
    npm2 install -g npm3
    ln -s /usr/local/lib/node_modules/npm3/bin/index.js /usr/local/bin/npm
fi
