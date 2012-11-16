#! /bin/bash

# install RVM
\curl -L https://get.rvm.io | bash -s stable
source "$HOME/.rvm/bin/rvm"

if [ -z "`which apt-get`" -o -z "`which yum`" ]; then
    # it's a mac!
    brew update
    brew tap homebrew/dupes
    brew install autoconf automake apple-gcc42
fi

# install packages
rvm pkg install openssl
rvm pkg install libyaml

# install basic rubies
rvm reinstall 1.9.3

if [ -z "`which apt-get`" -o -z "`which yum`" ]; then
    # it's a mac!
    rvm reinstall 1.8.7 --without-tcl --without-tk
else
    rvm reinstall 1.8.7
fi
