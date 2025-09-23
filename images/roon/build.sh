_packages="net-dns/bind net-fs/cifs-utils media-sound/alsa-utils media-video/ffmpeg dev-libs/nettle"

configure_builder()
{
    :
}

configure_rootfs_build()
{
    update_use 'media-video/ffmpeg' '+amr +amrenc +bzip2 +fdk +libsoxr +mp3 +opus +vorbis -xvid -x265 -x264 -webp -vpx -vaapi -vdpau -dav1d -pulseaudio -openal -speex'
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
