_packages=">=net-misc/yt-dlp-2025.09.23 media-video/ffmpeg net-misc/aria2 dev-python/pycryptodome"
BOB_INSTALL_BASELAYOUT=true

configure_builder()
{
    emerge --oneshot dev-libs/glib
    #update_keywords 'dev-libs/openssl' '+~amd64'
    copy_gcc_libs
    :
}

configure_rootfs_build()
{
    copy_gcc_libs

    # Ensure runtime user/group 1000:1000 exist
    if getent group 1000 >/dev/null; then
        YTDLP_GRP="$(getent group 1000 | cut -d: -f1)"
    else
        groupadd -g 1000 ytdlp
        YTDLP_GRP="ytdlp"
    fi
    if ! getent passwd 1000 >/dev/null; then
        useradd -u 1000 -d /home/ytdlp -g "${YTDLP_GRP}" -m ytdlp
    fi
    
    # ffmpeg: curated USE flags
    update_use 'media-video/ffmpeg' '+aac +chromaprint +fdk +lame +libaom +lzma +openh264 +openssl +opus +svt-av1 +theora +vaapi +vdpau +vorbis +vpx +webp +x264 +x265 +xvid'

    :
}

finish_rootfs_build()
{
    copy_gcc_libs

    # Update /etc configs as needed:
    etc-update --automode -5

    # Copy openssl.cnf to enable legacy for aria2
    mkdir -p "${_EMERGE_ROOT}/etc/ssl"
    cp "/config/etc/ssl/openssl.cnf" "${_EMERGE_ROOT}/etc/ssl/openssl.cnf"

    # Install yt-dlp wrapper script into image and prepare runtime dirs
    mkdir -p "${_EMERGE_ROOT}/opt/scripts"
    cp "/config/scripts/yt-dlp.sh" "${_EMERGE_ROOT}/opt/scripts/yt-dlp.sh"
    chmod +x "${_EMERGE_ROOT}/opt/scripts/yt-dlp.sh"
    # Default media mountpoint and home dir
    mkdir -p "${_EMERGE_ROOT}/media" "${_EMERGE_ROOT}/home/ytdlp"
    chown -R 1000:1000 "${_EMERGE_ROOT}/opt/scripts" "${_EMERGE_ROOT}/media" "${_EMERGE_ROOT}/home/ytdlp"
    :
}
