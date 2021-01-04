_packages="app-shells/bash =dev-util/artifactory-pro-bin-7.11.5"
configure_bob()
{
    :
}

configure_rootfs_build()
{
    rm -Rf /var/db/repos/gentoo; emerge --sync; etc-update --automode -5; emerge --oneshot portage
    sed -i '/app-shells\/bash.*/d' /etc/portage/profile/package.provided
    emerge net-misc/curl net-misc/rsync app-portage/layman
    configure_layman
    add_overlay haven-overlay  https://gitlab.thehavennet.org.uk/gentoo/haven-overlay.git
    update_keywords 'dev-util/artifactory-pro-bin' '+~amd64'
    groupadd -g 1000 artifactory
    useradd -u 1000 -g artifactory -d /opt/artifactory artifactory
    :
}

finish_rootfs_build()
{
    rm -Rf /opt/jfrog/artifactory/tomcat/logs/catalina/*
    :
}
