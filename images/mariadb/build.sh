#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="app-arch/pbzip2 net-misc/curl dev-db/mariadb"
_autosqlbackup_version="3.0_rc6"

#
# this method runs in the bb builder container just before building the rootfs
#
configure_rootfs_build()
{
    # sadly perl is required for db init scripts
    #update_use 'dev-db/mariadb' '-perl'
    # reinstall curl, needed at build time
    unprovide_package net-misc/curl
}

#
# this method runs in the bb builder container just before packing the rootfs
#
finish_rootfs_build()
{
    copy_gcc_libs
    mkdir -p "${_EMERGE_ROOT}"/var/run/{mysql,mysqld} "${_EMERGE_ROOT}"/var/lib/mysql
    chown mysql:mysql "${_EMERGE_ROOT}"/var/run/{mysql,mysqld} "${_EMERGE_ROOT}"/var/lib/mysql
    # remove curl again
    uninstall_package net-misc/curl
    # install automysqlbackup
    download_file https://sourceforge.net/projects/automysqlbackup/files/AutoMySQLBackup/AutoMySQLBackup%20VER%203.0/automysqlbackup-v"${_autosqlbackup_version}".tar.gz
    mkdir /root/automysqlbackup
    cd /root/automysqlbackup
    tar xzvf "${__download_file}"
    mkdir "${_EMERGE_ROOT}"/etc/automysqlbackup
    cp automysqlbackup "${_EMERGE_ROOT}"/usr/bin/
    cp automysqlbackup.conf "${_EMERGE_ROOT}"/etc/automysqlbackup/
    log_as_installed "manual install" "automysqlbackup-${_autosqlbackup_version}" "https://sourceforge.net/projects/automysqlbackup/"
}
