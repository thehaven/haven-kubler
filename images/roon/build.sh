_packages="app-arch/bzip2 net-misc/curl net-dns/bind-tools net-fs/cifs-utils media-sound/alsa-utils media-video/ffmpeg dev-libs/nettle"

configure_builder()
{
    :
}

configure_rootfs_build()
{
    update_use 'media-video/ffmpeg' '+amr +amrenc +bzip2 +cpudetection +encode +fdk +mp3 +threads +vorbis'
    emerge --update --newuse --deep media-video/ffmpeg
    :
}

finish_rootfs_build()
{
    copy_gcc_libs
    :
}
