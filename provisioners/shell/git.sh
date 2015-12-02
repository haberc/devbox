#install git

if [ ! -f /usr/local/bin/git ] ; then
    pkg install -y git
fi

# Set the default git editor to vim
git config --global core.editor "vim"
