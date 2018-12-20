_packages="app-shells/bash =dev-util/artifactory-pro-bin-6.2.0"
configure_bob()
{
    :
}

configure_rootfs_build()
{
    emerge rsync layman
    configure_layman
    add_overlay haven-overlay https://github.com/thehaven/haven-overlay.git
    update_keywords '=dev-util/artifactory-pro-bin-6.2.0' '+~amd64'
    :
}

finish_rootfs_build()
{
    :
}
