_packages="net-nntp/sonarr"

configure_rootfs_build()
{
    emerge net-misc/curl net-misc/rsync app-eselect/eselect-repository 
    eselect repository add haven-overlay git ssh://git@gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    update_use 'x11-libs/cairo' +X
    update_keywords 'dev-lang/mono' '+~amd64'
    update_keywords 'net-nntp/sonarr' '+~amd64'
    :
}

finish_rootfs_build()
{
    :
}
