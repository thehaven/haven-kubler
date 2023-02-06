#
# Kubler phase 1 config, pick installed packages and/or customize the build
#

# The recommended way to install software is setting ${_packages}
# List of Gentoo package atoms to be installed at custom root fs ${_EMERGE_ROOT}, optional, space separated
# If you are not sure about package names you may want to start an interactive build container:
#     haven.sh build -i haven/madsonic
# ..and then search the Portage database:
#     eix <search-string>
_packages="=media-sound/madsonic-bin-6.3.9840"
# Install a standard system directory layout at ${_EMERGE_ROOT}, optional, default: false
#BOB_INSTALL_BASELAYOUT=true

# Define custom variables to your liking
#_madsonic_version=1.0

# This hook can be used to configure the build container itself, install packages, run any command, etc
configure_bob()
{
    # Packages installed in this hook don't end up in the final image but are available for depending image builds
    #emerge dev-lang/go app-misc/foo
    add_overlay haven-overlay https://github.com/haven/haven-overlay.git
    echo 'USE="${USE} -X"'   >> /etc/portage/make.conf
}

# This hook is called just before starting the build of the root fs
configure_rootfs_build()
{

    update_use 'media-sound/madsonic-bin' '-systemd'
    update_use 'media-video/ffmpeg' '+mp3'
    update_use 'virtual/ffmpeg' '+mp3'
    update_keywords 'media-sound/madsonic-bin' '+~amd64'

    # Only needed when ${_packages} is empty, initializes PACKAGES.md
    #init_docs "haven/madsonic"
    :
}

# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
finish_rootfs_build()
{
    mkdir -p /config /media/{default,uploaded,podcast,playlist/{import,export,backup}}
}
