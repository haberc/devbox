#install ruby

# ruby-gems from ports depends on ruby21, so we install that

if [ ! -f /usr/local/bin/ruby21 ] ; then
    pkg install -y ruby21
fi

if [ ! -L /usr/local/bin/ruby ] ; then
    ln -s /usr/local/bin/ruby21 /usr/local/bin/ruby
fi

if [ ! -f /usr/local/bin/gem ] ; then
    # TODO: install gem without compiling an entirely new ruby
fi
