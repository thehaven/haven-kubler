#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages=">=dev-libs/openssl-3.5.3"

configure_builder()
{
    emerge --sync
    update_keywords 'dev-libs/openssl' '+~amd64'
    :
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    :
}
