_packages="net-nntp/lazylibrarian"

configure_builder()
{
    :
}

configure_rootfs_build()
{
    groupadd -g 1000 lazylibrarian 
    useradd -u 1000 -d /var/lazylibrarian -g lazylibrarian lazylibrarian
    mkdir /storage && chown 1000:1000 /storage
    :
}

finish_rootfs_build()
{
    :
}
