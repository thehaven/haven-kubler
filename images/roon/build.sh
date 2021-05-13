_packages="app-arch/bzip2 net-misc/curl net-dns/bind-tools net-fs/cifs-utils media-sound/alsa-utils media-video/ffmpeg"

configure_builder()
{
    :
}

configure_rootfs_build()
{
    update_use 'media-video/ffmpeg' '+bzip2 +cpudetection +encode +mp3 +threads +vorbis'
    :
}

finish_rootfs_build()
{
    copy_gcc_libs
    :
}
