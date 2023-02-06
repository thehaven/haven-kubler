#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages=""

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    # https://github.com/pi-hole/pi-hole
    curl -sSL https://install.pi-hole.net | bash
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    :
}
