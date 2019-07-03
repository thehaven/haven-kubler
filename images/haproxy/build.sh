_packages="net-proxy/haproxy"

configure_bob()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    sed -i '/dev-libs\/openssl.*/d' /etc/portage/profile/package.provided
    unmask_package 'dev-libs/openssl'
    update_keywords 'dev-libs/openssl' '+**'
    update_keywords 'net-proxy/haproxy' '+~amd64'
    update_use 'net-proxy/haproxy' '+crypt +net_ns +pcre +slz +ssl +threads +vim-syntax -zlib'
    emerge --unmerge dev-python/cryptography net-misc/iputils && emerge dev-libs/openssl
    emerge --usepkg=n haproxy
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    :
}
