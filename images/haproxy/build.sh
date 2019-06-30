_packages="net-proxy/haproxy"

configure_bob()
{
    #rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    #unmask_package 'dev-libs/openssl'
    #update_keywords 'dev-libs/openssl' '**'
    update_keywords 'net-proxy/haproxy' '+~amd64'
    update_use 'net-proxy/haproxy' '+crypt +net_ns +pcre +slz +ssl +threads +vim-syntax -zlib'
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    :
}
