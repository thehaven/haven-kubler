_packages="app-containers/kubler app-containers/docker-cli app-misc/jq net-misc/openssh net-misc/wget"
# Install a standard system directory layout at ${_EMERGE_ROOT}, optional, default: false
#BOB_INSTALL_BASELAYOUT=true

configure_builder()
{
    :
}

configure_rootfs_build()
{
    update_use 'net-misc/openssh' '+hpn'
    update_use 'app-containers/kubler' '-docker'
    update_use 'dev-vcs/git' '-perl'
    groupadd -g 239 docker
    groupadd -g 1000 kubler
    useradd -u 1000 -d /kubler -g kubler -G docker kubler
    :
}

finish_rootfs_build()
{
    :
}
