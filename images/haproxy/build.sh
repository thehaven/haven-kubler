_packages=">=net-proxy/haproxy-3.2.7"

configure_bob()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    export LUA_SINGLE_TARGET='lua5-4'
    update_keywords 'net-proxy/haproxy' '+~amd64'
    update_use 'net-proxy/haproxy' '+crypt +lua +net_ns +pcre +pcre-jit +slz +ssl +threads -zlib'
    copy_gcc_libs
}

configure_rootfs_build()
{
    if [ ! -e '/emerge-root/etc/group' ]; then mkdir -p '/emerge-root/etc' && touch '/emerge-root/etc/group'; fi
    :
}

finish_rootfs_build()
{
    :
}
