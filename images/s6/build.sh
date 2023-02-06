#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="sys-apps/s6 app-admin/entr"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    :
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    # s6 folders
    cp -r /config/etc/* "${_EMERGE_ROOT}"/etc/
    mkdir -p "${_EMERGE_ROOT}"/service
}
