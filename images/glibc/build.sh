#!/usr/bin/env bash
#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="sys-libs/glibc sys-libs/libxcrypt"
_timezone="${BOB_TIMEZONE:-UTC}"
_glibc_locales=("C.UTF8 UTF-8" "en_US.UTF-8 UTF-8")
BOB_SKIP_LIB_CLEANUP=true

configure_bob()
{
    local locale
    # set locales
    mv /etc/locale.gen /etc/locale.gen.bak
    for locale in "${_glibc_locales[@]}"; do
        echo "${locale}" >> /etc/locale.gen
    done
    locale-gen
    mkdir -p "${_EMERGE_ROOT}"/usr/lib/locale
    cp /usr/lib/locale/locale-archive "${_EMERGE_ROOT}"/usr/lib/locale/
    # set timezone
    echo $_timezone > /etc/timezone
    # 30.06.23 - update glibc in build container first to resolve a blocker
    emerge sys-libs/glibc
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    # as we broke the normal builder chain, recreate the docs for the busybox image
    init_docs 'haven/busybox'
    update_use 'sys-apps/busybox' +static +make-symlinks
    update_use 'sys-apps/sed' +static -acl -nls
    # bug with 1.31.1-r2 ebuild not respecting the static use flag
    provide_package sys-libs/glibc
    generate_doc_package_installed 'sys-apps/busybox' 'sys-apps/sed'
    update_use 'sys-apps/util-linux' -su -logger
    update_use 'sys-apps/sed' -static +acl +nls
    update_use 'sys-libs/ncurses' +minimal
    # remove workaround
    unprovide_package sys-libs/glibc
    # fake portage install
    provide_package sys-apps/portage

    # set locales
    mkdir -p "${_EMERGE_ROOT}"/etc
    cp /etc/locale.gen "${_EMERGE_ROOT}"/etc/
    # set timezone
    cp /etc/timezone "${_EMERGE_ROOT}"/etc/
    cp /usr/share/zoneinfo/"${_timezone}" "${_EMERGE_ROOT}"/etc/localtime
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    # purge glibc locales/charmaps
    for locale in "${_glibc_locales[@]}"; do
        locale=($locale)
        locales_filter+=('!' '-name' "${locale[0]}")
        charmaps_filter+=('!' '-name' "${locale[1]}.gz")
    done
    find "${_EMERGE_ROOT}"/usr/share/i18n/locales -type f "${locales_filter[@]}" -delete
    find "${_EMERGE_ROOT}"/usr/share/i18n/charmaps -type f "${charmaps_filter[@]}" -delete
    # backup iconv encodings so other images can pull them in again via _iconv_from=glibc
    tar -cpf "${_ROOTFS_BACKUP}"/glibc-iconv.tar "${_EMERGE_ROOT}"/usr/"${_LIB}"/gconv/
    # purge iconv
    rm -fr "${_EMERGE_ROOT}"/usr/"${_LIB}"/gconv/*
    # add entry to purged section in PACKAGES.md
    write_checkbox_line "Glibc Iconv Encodings" "checked" "${_DOC_FOOTER_PURGED}"
}
