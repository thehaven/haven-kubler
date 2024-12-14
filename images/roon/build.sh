_packages="net-dns/bind net-fs/cifs-utils media-sound/alsa-utils media-video/ffmpeg dev-libs/nettle"

configure_builder()
{
    :
}

configure_rootfs_build()
{
    #sed -i '/dev-build\/cmake.*/d' /etc/portage/profile/package.provided
    #sed -i '/app-crypt\/rhash.*/d' /etc/portage/profile/package.provided
    #copy_gcc_libs
    #ldconfig
    update_use 'media-video/ffmpeg' '+amr +amrenc +bzip2 +cpudetection +encode +fdk +mp3 +threads +vorbis -xvid -x265 -x264 -webp -vpx -vaapi -vdpau -dav1d'
    #emerge --newuse --deep --with-bdeps=y --changed-deps=y --binpkg-respect-use=y -kg dev-build/cmake
    update_use 'net-dns/bind' '+caps +geoip +gssapi'
    update_keywords 'net-dns/bind' '+~amd64'
    emerge -ukg net-dns/bind

    :
}

finish_rootfs_build()
{
    copy_gcc_libs
    :
}
