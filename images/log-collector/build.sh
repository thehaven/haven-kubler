#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="app-emulation/docker-gen"
_keep_headers=true
# need curl headers for fluentd gem installs
_headers_from=haven/bash

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    :
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    log_as_installed "gem install" "fluentd" "--no-ri --no-rdoc"
    log_as_installed "gem install" "fluent-plugin-elasticsearch" "--no-ri --no-rdoc"
}
