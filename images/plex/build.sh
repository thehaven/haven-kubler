_packages="app-shells/bash app-alternatives/sh media-tv/plex-media-server"

configure_bob()
{
    emerge --sync && emerge --oneshot portage 
    emerge net-misc/curl net-misc/rsync app-eselect/eselect-repository
    eselect repository add haven-overlay git ssh://git@gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    update_use 'net-dns/avahi' '+dbus'
    update_keywords 'media-tv/plex-media-server' '+~amd64'
}

configure_rootfs_build()
{
    update_use 'app-alternatives/sh' '+bash -busybox -dash -ksh -lksh -mksh'
    if [ ! -e '/emerge-root/etc/group' ]; then mkdir -p '/emerge-root/etc' && touch '/emerge-root/etc/group'; fi
    :
}

finish_rootfs_build()
{
    :
}
