#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="dev-libs/libressl"

configure_bob()
{
    add_layman_overlay libressl
    # libressl
    # https://wiki.gentoo.org/wiki/Project:LibreSSL
    echo 'USE="${USE} libressl"'   >> /etc/portage/make.conf 
    echo "-libressl"               >> /etc/portage/profile/use.stable.mask 
    echo "-curl_ssl_libressl"      >> /etc/portage/profile/use.stable.mask 
    echo "dev-libs/openssl"        >> /etc/portage/package.mask/openssl

    emerge -C dev-libs/openssl
    emerge -1 dev-libs/libressl net-misc/wget

    # always build from source for these as a binary package linked against an older libressl version forces a
    # downgrade to that version. possibly a bug in portage?
    local current_emerge_opts="${EMERGE_DEFAULT_OPTS}"
    export EMERGE_DEFAULT_OPTS="-b"
    update_use 'dev-vcs/git' '-perl' '+libressl'
    update_use 'net-misc/curl' '+curl_ssl_libressl' '-curl_ssl_openssl'
    emerge -1 net-misc/curl dev-vcs/git
    export EMERGE_DEFAULT_OPTS="${current_emerge_opts}"

    emerge @preserved-rebuild
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    update_use 'app-misc/ca-certificates' '-cacert'
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    :
}
