if [ ! -f /usr/local/bin/svn ] ; then
    env ASSUME_ALWAYS_YES=YES pkg install subversion
fi

# switch to the 'latest' PKG repo
repo_conf_file="/usr/local/etc/pkg/repos/FreeBSD.conf"
if [ ! -f $repo_conf_file ] ; then
    mkdir -p $(dirname $repo_conf_file)
    echo 'FreeBSD: {url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest"}' > $repo_conf_file
fi

# update package repo
pkg update


# inititalize ports tree
if [ ! -d /usr/ports ] ; then
    portsnap --interactive fetch
    portsnap extract
else
    portsnap --interactive fetch update
fi

if [ ! -L /etc/ssl/cert.pem ] ; then
    cd /usr/ports/security/ca_root_nss
    make install clean
fi


# download kernel sources
# optional. only enable this, if you actually need it.
# the download takes quite some time
# if [ ! -f /usr/src/README ] ; then
#     svn export \
#         --force \
#         --non-interactive \
#         --trust-server-cert \
#         https://svn.freebsd.org/base/release/10.2.0/ /usr/src
# fi
