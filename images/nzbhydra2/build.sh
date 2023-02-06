_packages="net-nntp/nzbhydra2"
configure_builder()
{
    :
}

configure_rootfs_build()
{
    #rm -Rf /var/db/repos/gentoo; emerge --sync; etc-update --automode -5; emerge --oneshot portage
    #sed -i '/app-shells\/bash.*/d' /etc/portage/profile/package.provided
    emerge -u net-misc/curl net-misc/rsync app-portage/layman
    add_overlay haven-overlay  https://gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    groupadd -g 1000 nzbhydra2
    useradd -u 1000 -g nzbhydra2 -d /opt/nzbhydra2/ nzbhydra2
    :
}

finish_rootfs_build()
{
    :
}
