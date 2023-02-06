_packages="app-text/calibre"
# Install a standard system directory layout at ${_EMERGE_ROOT}, optional, default: false
#BOB_INSTALL_BASELAYOUT=true

configure_builder()
{
    echo """[DEFAULT]
main-repo = gentoo

[gentoo]
location = /usr/portage
sync-type = git
sync-uri = https://gitlab-ee.thehavennet.org.uk/gentoo/gentoo.git
auto-sync = yes""" > /etc/portage/repos.conf/gentoo.conf

    [ -d /etc/portage/postsync.d ] && rm -Rf /etc/portage/postsync.d
    #[ ! -d /var/cache/eix ] && mkdir /var/cache/eix; eix-update
    echo 'FEATURES="-ipc-sandbox -network-sandbox -pid-sandbox"' >> /etc/portage/make.conf
    mkdir -p /var/db/repos/{gentoo,haven-overlay,kubler} && emerge --sync
    :
}

configure_rootfs_build()
{
    update_use 'app-text/poppler' '+qt5'
    update_use 'dev-python/PyQt5' '+gui +widgets +svg +printsupport +network +webchannel'
    update_use 'dev-qt/qtgui' '+jpeg +X'
    update_use 'app-text/xmlto' '+text'
    update_use 'dev-libs/libxml2' '+icu'
    update_use 'dev-qt/qtwebchannel' '+qml'
    update_use 'dev-qt/qtwebengine' '+widgets'
    update_use 'media-libs/libglvnd' '+X'
    update_use 'x11-libs/libxkbcommon' '+X'
    groupadd -g 1000 calibre
    useradd -u 1000 -d /calibre -g calibre calibre
    :
}

finish_rootfs_build()
{
    :
}
