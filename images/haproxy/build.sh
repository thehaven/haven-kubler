_packages="net-proxy/haproxy"

configure_bob()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    update_keywords 'net-proxy/haproxy' '+~amd64'
    update_use 'net-proxy/haproxy' '+crypt +net_ns +pcre +slz +ssl +threads +vim-syntax -zlib'
    #emerge --usepkg=n haproxy
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
