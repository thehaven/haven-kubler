#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="dev-java/openjdk"

configure_builder()
{
    update_use -postscript
    update_use 'dev-java/openjdk' '+headless-awt +gentoo-vm -alsa -cups'
    echo 'dev-java/openjdk -gentoo-vm' >> /etc/portage/profile/package.use.mask
    update_keywords dev-java/openjdk '+~amd64'
    # skip python and iced-tea
    provide_package dev-lang/python dev-lang/python-exec dev-java/icedtea-bin

    # install java in build container so depending builds have it available
    emerge dev-java/openjdk
}


# This hook is called just before starting the build of the root fs
configure_rootfs_build()
{
    # add user/group for unprivileged container usage
    groupadd -g 808 java || echo "java group already exists"
    useradd -u 8080 -g java -d /home/java java || echo "java user already exists"
    mkdir -p "${_EMERGE_ROOT}"/home/java
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    # required by fontconfig
    copy_gcc_libs
    # gentoo's run-java-tool.bash wrapper expects which at /usr/bin
    ln -rs "${_EMERGE_ROOT}"/bin/which "${_EMERGE_ROOT}"/usr/bin/which
}
