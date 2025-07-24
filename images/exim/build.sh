#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="mail-mta/exim"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    update_use 'mail-mta/exim' '+dovecot-sasl +dnsdb +dsn +exiscan-acl +ldap +maildir +mysql +perl +sasl +spf +sqlite -radius'
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    copy_gcc_libs 
}
