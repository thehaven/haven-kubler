_packages="net-proxy/haproxy"

configure_bob()
{
    emerge --sync && emerge --oneshot portage
    emerge net-misc/curl net-misc/rsync app-portage/layman
    configure_layman
    add_overlay haven-overlay https://github.com/thehaven/haven-overlay.git
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
