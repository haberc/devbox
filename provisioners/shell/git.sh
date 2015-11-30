#install git
cd /usr/ports/devel/git
make install clean

# Set the default git editor to vim
git config --global core.editor "vim"
