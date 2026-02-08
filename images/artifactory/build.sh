_packages="app-shells/bash app-alternatives/sh =dev-util/artifactory-pro-bin-7.12.6 dev-db/sqlite"
configure_bob()
{
    :
}

configure_rootfs_build()
{
    [ ! -d /var/cache/eix ] && mkdir /var/cache/eix; chown portage:portage /var/cache/eix/; eix-update
    rm -Rf /var/db/repos/gentoo; emerge --sync; etc-update --automode -5; emerge --oneshot portage
    emerge net-misc/curl net-misc/rsync
    add_overlay haven-overlay  https://gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    update_use 'app-alternatives/sh' '+bash -busybox -dash -ksh -lksh -mksh'
    sed -i '/app-shells\/bash.*/d' /etc/portage/profile/package.provided
    emerge app-shells/bash
    update_keywords 'dev-util/artifactory-pro-bin' '+**'
    groupadd -g 1000 artifactory
    useradd -u 1000 -g artifactory -d /opt/artifactory artifactory
    :
}

finish_rootfs_build()
{
    rm -Rf "${_EMERGE_ROOT}/opt/jfrog/artifactory/tomcat/logs/catalina/*"
    chown -Rf artifactory:artifactory "${_EMERGE_ROOT}/opt/jfrog"
    :
}
