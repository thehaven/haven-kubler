_packages="app-shells/bash =dev-util/artifactory-pro-bin-6.2.0"
configure_bob()
{
    :
}

configure_rootfs_build()
{
    emerge net-misc/curl net-misc/rsync app-portage/layman
    configure_layman
    add_overlay haven-overlay https://github.com/thehaven/haven-overlay.git
    update_keywords '=dev-util/artifactory-pro-bin-6.2.0' '+~amd64'
    :
}

finish_rootfs_build()
{
    rm -Rf /opt/artifactory/tomcat/logs/catalina
    :
}
