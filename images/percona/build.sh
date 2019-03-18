_packages="app-arch/pbzip2 net-misc/curl dev-db/percona-server"

configure_rootfs_build()
{
    unprovide_package net-misc/curl
    update_keywords 'dev-db/percona-server' '+~amd64'
    update_use 'dev-db/percona-server' '-client-libs +jemalloc -perl'
}

finish_rootfs_build()
{
    copy_gcc_libs
    uninstall_package net-misc/curl
}
