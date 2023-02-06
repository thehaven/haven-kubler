#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="app-crypt/p11-kit app-eselect/eselect-java dev-java/java-config =dev-java/oracle-jdk-bin-1.8.0.202"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    download_from_oracle "https://github.com/frekele/oracle-java/releases/download/8u202-b08/jdk-8u202-linux-x64.tar.gz"
    update_use 'dev-java/oracle-jdk-bin' '+headless-awt +gentoo-vm -alsa -cups'
    # skip python and iced-tea
    provide_package dev-lang/python dev-java/icedtea-bin

    # add user/group for unprivileged container usage
    groupadd -g 808 java
    useradd -u 8080 -g java -d /home/java java
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
