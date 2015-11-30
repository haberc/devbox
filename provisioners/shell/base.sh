ls -la /vagrant


if [ ! -f /usr/local/bin/svn ] ; then
    env ASSUME_ALWAYS_YES=YES pkg install subversion
fi

# download kernel sources
if [ ! -f /usr/src/README ] ; then
    svn export \
        --force \
        --non-interactive \
        --trust-server-cert-failures unknown-ca \
        https://svn.freebsd.org/base/release/10.2.0/ /usr/src
fi

# inititalize ports tree
if [ ! -d /usr/ports ] ; then
    portsnap --interactive fetch
    portsnap extract
else
    portsnap update
fi
