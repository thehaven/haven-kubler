_packages=""
configure_builder()
{
    :
}

configure_rootfs_build()
{
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
    #export DISTRIBUTION_DIR="${GOPATH}/src/github.com/haven/splunk-licence-server"
    #mkdir -p "${DISTRIBUTION_DIR}"

    #git clone https://github.com/haven/splunk-licence-server.git "${DISTRIBUTION_DIR}"
    #cd "${DISTRIBUTION_DIR}"
    #git checkout tags/v${_splunk-licence-server_version}
    #echo "building splunk-licence-server ${_splunk-licence-server_version}.."
    #go run build.go build
    #mkdir -p "${_EMERGE_ROOT}"/usr/local/{bin,share}

    # Everything at ${_EMERGE_ROOT} will end up in the final image
    #cp -rp "${DISTRIBUTION_DIR}/bin/*" "${_EMERGE_ROOT}/usr/local/bin"

    # After installing packages manually you might want to add an entry to PACKAGES.md
    #log_as_installed "manual install" "splunk-licence-server-${_splunk-licence-server_version}" "https://splunk-licence-server.org/"

    # To uninstall software packages in the builder unset ROOT env first
    #unset ROOT
    #emerge -C foo/bar
    :
}
