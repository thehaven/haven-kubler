_packages="=media-sound/madsonic-bin-7.0.10400"
BOB_INSTALL_BASELAYOUT=true

configure_bob()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    add_overlay haven-overlay https://github.com/haven/haven-overlay.git
    echo 'USE="${USE} -X"'   >> /etc/portage/make.conf
    echo 'FEATURES="-ipc-sandbox -network-sandbox -pid-sandbox"' >> /etc/portage/make.conf
    update_use 'media-sound/madsonic-bin' '-systemd'
    update_use 'media-video/ffmpeg' '-X +mp3'
    update_keywords 'media-sound/madsonic-bin' '+~amd64'
    copy_gcc_libs
    emerge dev-libs/glib sys-apps/baselayout-java
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    mkdir -p /config /media/{default,uploaded,podcast,playlist/{import,export,backup}}
}
