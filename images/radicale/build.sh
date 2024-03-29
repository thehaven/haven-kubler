_packages="www-apps/radicale"

configure_bob()
{
    :
}

configure_rootfs_build()
{
    update_use 'dev-vcs/git' '+python_targets_python2_7'
    emerge net-misc/curl net-misc/rsync app-eselect/eselect-repository
    eselect repository add haven-overlay git ssh://git@gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    update_keywords 'dev-python/python-dateutil' '+~amd64'
    update_keywords 'dev-python/vobject' '+~amd64'
    update_keywords 'www-apps/radicale' '+~amd64'
    :
}

finish_rootfs_build()
{
    :
}
