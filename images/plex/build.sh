_packages="app-shells/bash media-tv/plex-media-server"

configure_bob()
{
    emerge --sync && emerge --oneshot portage 
    emerge net-misc/curl net-misc/rsync app-portage/layman
    configure_layman
    add_overlay haven-overlay https://github.com/thehaven/haven-overlay.git
    update_use 'net-dns/avahi' '+dbus'
    update_keywords 'media-tv/plex-media-server' '+~amd64'
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    :
}
