#install ruby

if [ ! -L /usr/local/bin/ruby ] ; then
    pkg install -y ruby
fi

if [ ! -L /usr/local/bin/gem ] ; then
    cd /usr/ports/devel/ruby-gems
    make install clean
fi
