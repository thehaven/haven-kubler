#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="mail-mta/opensmtpd"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    update_keywords net-libs/libasr-1.0.4 '+~amd64'
    update_keywords mail-mta/opensmtpd-6.6.4_p1 '+~amd64'
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    sed-or-die 'listen on localhost' 'listen on 0.0.0.0' "${_EMERGE_ROOT}"/etc/smtpd/smtpd.conf
    mkdir "${_EMERGE_ROOT}"{/run,/var/run}
}
