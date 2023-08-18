#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="www-servers/nginx dev-libs/libpcre2"
# ..or when using mva overlay
#_packages="www-servers/nginx::mva"

# openssl 3.x update breaks bin packages linked against 1.x
_no_cache_20230630=www-servers/nginx

configure_bob()
{
    # add mva overlay which has nginx with pagespeed and other goodies
    #add_overlay mva
    :
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    echo 'NGINX_MODULES_HTTP="access addition auth_basic auth_pam autoindex brotli browser charset dav dav_ext empty_gif fancyindex fastcgi geo geoip gzip gzip_static headers_more http2 limit_req limit_zone map memc memcached metrics ndk ngx_pagespeed passenger proxy realip redislog referer rewrite scgi slowfs_cache split_clients srcache ssi stub_status sub tcpconns threads upload_progress upstream_ip_hash upstream_keepalive upstream_least_conn userid uwsgi vhost_traffic_status xslt"' >> /etc/portage/make.conf
    echo 'NGINX_MODULES_MAIL="imap smtp"' >> /etc/portage/make.conf
    echo 'NGINX_MODULES_STREAM="access limit_conn upstream_least_conn upstream_zone"' >> /etc/portage/make.conf

    update_use 'app-misc/mime-types' '+nginx'
    update_use 'www-servers/nginx' '+nginx_modules_http_v2 +aio +http2 -pcre2 +pcre-jit +ssl +ssl-cert-cb +threads'
    update_use 'dev-libs/libpcre' '-readline +jit'
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
