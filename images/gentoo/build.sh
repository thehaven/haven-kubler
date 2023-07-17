_packages="sys-apps/portage app-eselect/eselect-repository app-editors/vim app-portage/eix"
BOB_INSTALL_BASELAYOUT=true

configure_builder()
{
    :
}

configure_rootfs_build()
{
    rm -Rf /var/sync/portage && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    :
}

finish_rootfs_build()
{
    :
}
