#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="net-misc/curl app-admin/eselect app-portage/portage-utils app-shells/bash app-arch/zstd"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    update_use 'sys-libs/ncurses' '+minimal'
    # these use flags pull in gcc as runtime dep
    update_use app-portage/portage-utils -qmanifest -qtegrity -openmp
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    cp /etc/{passwd,group,inputrc} "${_EMERGE_ROOT}"/etc
    # add ll global alias
    echo "alias ll='ls -lah --group-directories-first'" >> "${_EMERGE_ROOT}"/etc/bash/bashrc
}
