#!/usr/bin/env bash

# Setup rndc
    if [[ ! -f '/etc/bind/rndc.key' && ! -f '/etc/bind/rndc.conf' ]]; then
        echo "Using /dev/urandom for generating rndc.key"
        /usr/sbin/rndc-confgen -a -u named
        chmod 0640 /etc/bind/rndc.key || die
    fi

    [ ! -d /var/bind/pri ] && mkdir /var/bind/pri;
    [ ! -d /var/bind/sec ] && mkdir /var/bind/sec;
    [ ! -d /var/bind/dyn ] && mkdir /var/bind/dyn;
    [ ! -L /etc/bind/pri ] && ln -s /var/bind/pri /etc/bind/pri
    [ ! -L /etc/bind/sec ] && ln -s /var/bind/sec /etc/bind/sec
    [ ! -L /etc/bind/dyn ] && ln -s /var/bind/dyn /etc/bind/dyn

# Check for named.conf and create default:
    if [[ ! -f '/etc/bind/named.conf' ]]; then
        echo "Creating simple named.conf"
        cp /named.conf.tmpl /etc/named.conf      
    fi
# Run Bind:
    echo "Launching bind"
    /usr/sbin/named -g -u named
