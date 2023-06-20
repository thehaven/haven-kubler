_packages="net-nntp/nzbhydra2"
configure_builder()
{
    :
}

configure_rootfs_build()
{
    emerge -u net-misc/curl net-misc/rsync app-eselect/eselect-repository 
    eselect repository add haven-overlay git ssh://git@gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    groupadd -g 1000 nzbhydra2
    useradd -u 1000 -g nzbhydra2 -d /opt/nzbhydra2/ nzbhydra2
    :
}

finish_rootfs_build()
{
    :
}
