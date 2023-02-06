_packages="net-nntp/jackett"

configure_rootfs_build()
{
    emerge net-misc/curl net-misc/rsync app-portage/layman
    add_overlay haven-overlay https://github.com/thehaven/haven-overlay.git
    update_use 'x11-libs/cairo' +X
    update_keywords 'dev-lang/mono' '+~amd64'
    update_keywords 'net-nntp/jackett' '+~amd64'
    :
}

finish_rootfs_build()
{
    :
}
