#!/usr/bin/env bash

# Setup rndc
    if [[ ! -f '/etc/bind/rndc.key' && ! -f '/etc/bind/rndc.conf' ]]; then
        einfo "Using /dev/urandom for generating rndc.key"
        /usr/sbin/rndc-confgen -a
        chown root:named /etc/bind/rndc.key || die
        chmod 0640 /etc/bind/rndc.key || die
    fi


    [ ! -d /var/bind/pri ] && mkdir /var/bind/pri; chown root:named /var/bind/pri
    [ ! -d /var/bind/sec ] && mkdir /var/bind/sec; chown root:named /var/bind/sec
    [ ! -d /var/bind/dyn ] && mkdir /var/bind/dyn; chown root:named /var/bind/dyn
    [ ! -L /etc/bind/pri ] && ln -s /var/bind/pri /etc/bind/pri
    [ ! -L /etc/bind/sec ] && ln -s /var/bind/sec /etc/bind/sec
    [ ! -L /etc/bind/dyn ] && ln -s /var/bind/dyn /etc/bind/dyn
