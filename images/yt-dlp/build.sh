#
# Kubler phase 1 config, pick installed packages and/or customize the build
#

# The recommended way to install software is setting ${_packages}
# List of Gentoo package atoms to be installed at custom root fs ${_EMERGE_ROOT}, optional, space separated
# If you are not sure about package names you may want to start an interactive build container:
#     kubler.sh build -i haven/yt-dlp
# ..and then search the Portage database:
#     eix <search-string>
_packages="app-shells/bash net-misc/yt-dlp media-video/ffmpeg net-misc/aria2"
# Install a standard system directory layout at ${_EMERGE_ROOT}, optional, default: false
#BOB_INSTALL_BASELAYOUT=true

# Remove specified binary cache file(s) *once* for given tag key..
#_no_cache_20200731="sys-apps/bash foo/bar/bar-0.1.2-r3.xpak"
# ..or omit the tag to always remove given binary cache file(s).
#_no_cache="sys-apps/bash"

# Define custom variables to your liking
#_yt-dlp_version=1.0

#
# This hook can be used to configure the build container itself, install packages, run any command, etc
#
configure_builder()
{
    # Packages installed in this hook don't end up in the final image but are available for depending image builds
    #emerge dev-lang/go app-misc/foo
    emerge --oneshot dev-libs/glib
    :
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    # Update a Gentoo package use flag..
    #update_use 'dev-libs/some-lib' '+feature' '-some_other_feature'

    # ..or a Gentoo package keyword
    #update_keywords 'dev-lang/some-package' '+~amd64'

    # Download a file and add it to Portage's patch dir (/etc/portage/patches), 3rd arg is optional
    #add_patch sys-apps/bash https://foo.net/bar.patch my_custom_name

    # Add a package to Portage's package.provided file, effectively skipping it during installation
    #provide_package 'dev-lang/some-package'

    # This can be useful to install a package from a parent image again, it may be needed at build time
    #unprovide_package 'dev-lang/some-package'

    # Only needed when ${_packages} is empty, initializes PACKAGES.md
    #init_docs "haven/yt-dlp"
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
    # ffmpeg: curated USE flags for YouTube/AV1 decode and muxing
    # - Prefer openssl (disable gnutls) for TLS
    # - Enable AV1 decode via dav1d; libaom for completeness (encode/alt decode)
    # - Enable common codecs/containers/subtitles and hardware accel hooks
    update_use 'media-video/ffmpeg' '+bzip2 +chromaprint +dav1d -drm +fontconfig -gnutls +gpl +libass +librtmp +libsoxr +openssl +opus +postproc +svt-av1 +theora +truetype -vaapi -vdpau +vorbis +vpx +webp +x264 -x265 -xvid -libaom +xml +zlib'
    :
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    # Useful helpers

    # Thin wrapper for sed that fails the build if no match was found, default sed delimiter is %
    #sed-or-die '^foo' 'replaceval' "${_EMERGE_ROOT}"/etc/foo.conf

    # Download file at url to /distfiles if it doesn't exist yet, file name is derived from last url fragment
    #download_file "$url"
    #echo "${__download_file}"
    # Same as above but set a custom file name
    #download_file "$url" my_file_v1.tar.gz
    # Same as above but pass arbitrary additional args to curl
    #download_file "$url" my_file_v1.tar.gz '-v' '--cookie' 'foo'

    # install su-exec at ${_EMERGE_ROOT}
    #install_suexec
    # Copy c++ libs, may be needed if you see errors regarding missing libstdc++
    #copy_gcc_libs

    # Example for a manual build if _packages method does not suffice, a typical use case is a Go project:

    #export GOPATH="/go"
    #export PATH="${PATH}:/go/bin"
    #export DISTRIBUTION_DIR="${GOPATH}/src/github.com/haven/yt-dlp"
    #mkdir -p "${DISTRIBUTION_DIR}"

    #git clone https://github.com/haven/yt-dlp.git "${DISTRIBUTION_DIR}"
    #cd "${DISTRIBUTION_DIR}"
    #git checkout tags/v${_yt-dlp_version}
    #echo "building yt-dlp ${_yt-dlp_version}.."
    #go run build.go build
    #mkdir -p "${_EMERGE_ROOT}"/usr/local/{bin,share}

    # Everything at ${_EMERGE_ROOT} will end up in the final image
    #cp -rp "${DISTRIBUTION_DIR}/bin/*" "${_EMERGE_ROOT}/usr/local/bin"

    # After installing packages manually you might want to add an entry to PACKAGES.md
    #log_as_installed "manual install" "yt-dlp-${_yt-dlp_version}" "https://yt-dlp.org/"

    # To uninstall software packages in the builder unset ROOT env first
    #unset ROOT
    #emerge -C foo/bar
    # Install yt-dlp wrapper script into image and prepare runtime dirs
    mkdir -p "${_EMERGE_ROOT}/opt/scripts"
    cp "/config/scripts/yt-dlp.sh" "${_EMERGE_ROOT}/opt/scripts/yt-dlp.sh"
    chmod +x "${_EMERGE_ROOT}/opt/scripts/yt-dlp.sh"
    # Default media mountpoint and home dir
    mkdir -p "${_EMERGE_ROOT}/media" "${_EMERGE_ROOT}/home/ytdlp"
    chown -R 1000:1000 "${_EMERGE_ROOT}/opt/scripts" "${_EMERGE_ROOT}/media" "${_EMERGE_ROOT}/home/ytdlp"
    :
}
