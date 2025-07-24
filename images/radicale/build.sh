_packages="www-apps/radicale"

configure_bob()
{
    :
}

configure_rootfs_build()
{
    emerge net-misc/curl net-misc/rsync dev-vcs/git
    update_keywords 'dev-python/python-dateutil' '+~amd64'
    update_keywords 'dev-python/vobject' '+~amd64'
    update_keywords 'www-apps/radicale' '+~amd64'
    :
}

finish_rootfs_build()
{
    :
}
