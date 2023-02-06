#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="www-servers/nginx::mva dev-libs/libpcre2"
# ..or when using mva overlay
#_packages="www-servers/nginx::mva"

configure_bob()
{
    # add mva overlay which has nginx with pagespeed and other goodies
    add_overlay mva
    :
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    echo 'NGINX_MODULES_HTTP="access addition auth_basic auth_pam autoindex brotli browser charset dav dav_ext empty_gif fancyindex fastcgi geo geoip gzip gzip_static headers_more http2 limit_req limit_zone lua map memc memcached metrics naxsi ndk ngx_pagespeed passenger proxy realip redislog referer rewrite scgi slowfs_cache split_clients srcache ssi stub_status sub tcpconns threads upload_progress upstream_ip_hash upstream_keepalive upstream_least_conn userid uwsgi vhost_traffic_status xslt"' >> /etc/portage/make.conf
    echo 'NGINX_MODULES_MAIL="imap smtp"' >> /etc/portage/make.conf
    echo 'NGINX_MODULES_STREAM="access limit_conn upstream_least_conn upstream_zone"' >> /etc/portage/make.conf
    update_keywords 'www-servers/nginx' '+~amd64'
    update_use 'www-servers/nginx' '+http2'
    update_use 'dev-libs/libpcre' '-readline'
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    mkdir -p "${_EMERGE_ROOT}"/etc/nginx/conf.d
    # required if pagespeed module is included
    #copy_gcc_libs
    # remove overlay
    #unset ROOT
    #eselect repository remove mva
}
