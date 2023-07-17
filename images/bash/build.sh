#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="sys-libs/readline net-misc/curl app-admin/eselect app-portage/portage-utils app-shells/bash"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    add_overlay haven-overlay https://gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    rm -Rf /var/sync/portage /var/db/repos/gentoo && emerge --sync && etc-update --automode -5 && emerge --oneshot portage
    #rm -rf /var/db/repos/gentoo
    mkdir -p /var/cache/eix
    chown portage:portage /var/cache/eix
    emerge --sync
    emerge dev-util/pkgconf virtual/pkgconfig
    update_use 'sys-libs/ncurses' '+minimal'
    unprovide_package sys-libs/readline
    # these use flags pull in gcc as runtime dep
    update_use app-portage/portage-utils -qmanifest -qtegrity
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    cp /etc/{passwd,group,inputrc} "${_EMERGE_ROOT}"/etc
    # busybox's grep doesn't support --colour=auto args, add a check for the alias in bashrc
    sed-or-die 'alias grep=' 'grep --colour=auto root /etc/group \&> /dev/null \&\& alias grep=' \
        "${_EMERGE_ROOT}"/etc/bash/bashrc
    # add ll global alias
    echo "alias ll='ls -lah --group-directories-first'" >> "${_EMERGE_ROOT}"/etc/bash/bashrc
}
