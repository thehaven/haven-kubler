_packages="net-dns/bind sys-process/procps"
BOB_INSTALL_BASELAYOUT=true

configure_builder()
{
    emerge --sync
    update_use 'net-dns/bind' '+caps +geoip +gssapi'
    emerge -ukg net-misc/curl net-misc/rsync app-eselect/eselect-repository 
    eselect repository add haven-overlay git ssh://git@gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    update_keywords 'net-dns/bind' '+~amd64'
    update_use 'net-dns/bind' '+caps +geoip +gssapi'
    emerge -ukg net-dns/bind
    :
}

configure_rootfs_build()
{
    update_keywords 'net-dns/bind' '+~amd64'
    update_keywords 'net-dns/bind-tools' '+~amd64'
    update_use 'net-dns/bind' '+caps +geoip +gssapi'
    update_use 'net-dns/bind-tools' '+gssapi'
    :
}

finish_rootfs_build()
{
    copy_gcc_libs
    emerge --config net-dns/bind
    :
}
