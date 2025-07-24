_packages="=media-sound/madsonic-bin-7.0.10400"
BOB_INSTALL_BASELAYOUT=true

configure_bob()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    add_overlay haven-overlay https://github.com/haven/haven-overlay.git
    echo 'USE="${USE} -X"'   >> /etc/portage/make.conf
    echo 'FEATURES="-ipc-sandbox -network-sandbox -pid-sandbox"' >> /etc/portage/make.conf
    update_use 'media-sound/madsonic-bin' '-systemd'
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
    CHROOT='/emerge-root'
    mkdir -p ${CHROOT}/config ${CHROOT}/media/{default,uploaded,podcast,playlist/{import,export,backup}}
    
    # Update uid and gid to 1000:1000 within the chroot:
    if chroot ${CHROOT} id madsonic > /dev/null 2>&1; then 
        usermod -R ${CHROOT} -u 1000 madsonic

        if chroot ${CHROOT} getent group madsonic > /dev/null 2>&1; then 
	    groupmod -R ${CHROOT} -g 1000 madsonic
            usermod -R ${CHROOT} -g 1000 madsonic
	fi
    fi

    # Fix up permissions to match the new uid/gid set above:
    [[ -d ${CHROOT}/usr/libexec/madsonic ]] && chown -Rf 1000:1000 ${CHROOT}/usr/libexec/madsonic
    [[ -d ${CHROOT}/var/lib/madsonic ]] && chown -Rf 1000:1000 ${CHROOT}/var/lib/madsonic
    [[ -d ${CHROOT}/config ]] && chown -Rf 1000:1000 ${CHROOT}/config

}
