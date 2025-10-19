#!/usr/bin/env bash

set -e

# Setup rndc
if [[ ! -f '/etc/bind/rndc.key' && ! -f '/etc/bind/rndc.conf' ]]; then
    echo "Using /dev/urandom for generating rndc.key"
    /usr/sbin/rndc-confgen -a -u named
    chmod 0640 /etc/bind/rndc.key
fi

[ ! -d /var/bind/pri ] && mkdir -p /var/bind/pri
[ ! -d /var/bind/sec ] && mkdir -p /var/bind/sec
[ ! -d /var/bind/dyn ] && mkdir -p /var/bind/dyn

[ ! -L /etc/bind/pri ] && ln -s /var/bind/pri /etc/bind/pri
[ ! -L /etc/bind/sec ] && ln -s /var/bind/sec /etc/bind/sec
[ ! -L /etc/bind/dyn ] && ln -s /var/bind/dyn /etc/bind/dyn

# Check for named.conf and create default if missing
if [[ ! -f '/etc/bind/named.conf' ]]; then
    echo "Creating simple named.conf"
    cp /named.conf.tmpl /etc/bind/named.conf
fi

# Functions to detect address families
has_ipv4() {
    ip -4 addr show scope global | grep -q inet
}

has_ipv6() {
    ip -6 addr show scope global | grep -q inet6
}

# Build named flags based on detected address families
NAMED_FLAGS="-g -u named"

if has_ipv4 && has_ipv6; then
    echo "Both IPv4 and IPv6 detected, running dual-stack."
elif has_ipv4; then
    NAMED_FLAGS="$NAMED_FLAGS -4"
    echo "Only IPv4 detected, running IPv4-only."
elif has_ipv6; then
    NAMED_FLAGS="$NAMED_FLAGS -6"
    echo "Only IPv6 detected, running IPv6-only."
else
    echo "Neither IPv4 nor IPv6 detected. Exiting."
    exit 1
fi

echo "Launching bind with: /usr/sbin/named $NAMED_FLAGS"
exec /usr/sbin/named $NAMED_FLAGS
