#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="dev-lang/mono"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    update_use 'x11-libs/cairo' +X
    :
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    :
}
