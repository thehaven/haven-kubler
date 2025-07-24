### haven/madsonic:dev

Built: Thu 24 Jul 14:09:34 BST 2025
Image Size: 1.02GB

#### Installed
Package | USE Flags
--------|----------
acct-group/portage-0-r2 | ``
acct-user/portage-0-r3 | ``
app-admin/eselect-1.4.30 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-alternatives/tar-0 | `gnu -libarchive (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/tar-1.35 | `acl nls xattr -minimal (-selinux) -verify-sig`
app-arch/xz-utils-5.8.1-r1 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.7-r1 | `lzma zlib -lz4 -static-libs -test`
app-crypt/gnupg-2.4.8 | `bzip2 nls readline smartcard ssl tofu -doc -ldap (-selinux) -test -tools -tpm -usb -user-socket -verify-sig -wks-server`
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-crypt/p11-kit-0.25.5 | `libffi nls -gtk-doc -systemd -test`
app-crypt/pinentry-1.3.1-r1 | `ncurses -`
app-eselect/eselect-java-0.5.1 | ``
app-misc/ca-certificates-20240203.3.98 | `-cacert`
app-misc/mime-types-2.1.54 | `-nginx`
app-misc/pax-utils-1.3.8 | `-caps -man -python (-seccomp) -test`
app-portage/gemato-20.6 | `gpg -pretty-log -test -tools`
app-portage/getuto-1.15 | `-test`
app-shells/bash-5.2_p37-r3 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
dev-db/sqlite-3.50.2 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-java/java-config-2.3.4 | `compat -test`
dev-java/openjdk-bin-21.0.7_p6-r1 | `-alsa -cups -headless-awt (-selinux) -source`
dev-lang/python-3.13.5 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/elfutils-0.193 | `bzip2 lzma nls utils -debuginfod -stacktrace -static-libs -test -valgrind -verify-sig -zstd`
dev-libs/expat-2.7.1 | `unicode -examples -static-libs -test`
dev-libs/fribidi-1.0.16 | `-doc -test`
dev-libs/glib-2.84.3 | `elf introspection mime xattr -dbus -debug -doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gmp-6.3.0-r1 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/gobject-introspection-1.84.0-r1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.84.0 | ``
dev-libs/libassuan-3.0.0-r1 | `-verify-sig`
dev-libs/libffi-3.5.1 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libgcrypt-1.11.1 | `asm getentropy -doc -static-libs -verify-sig`
dev-libs/libgpg-error-1.55 | `nls -common-lisp -static-libs -test -verify-sig`
dev-libs/libksba-1.6.7 | `-static-libs -verify-sig`
dev-libs/libpcre2-10.45 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/libtasn1-4.20.0 | `-static-libs -test -verify-sig`
dev-libs/libunistring-1.3 | `-doc -static-libs`
dev-libs/libxml2-2.13.8 | `python readline -examples -icu -lzma -static-libs -test`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-libs/mpfr-4.2.2 | `-static-libs -verify-sig`
dev-libs/nettle-3.10.1 | `asm gmp -doc -static-libs -verify-sig`
dev-libs/npth-1.8 | `-test`
dev-libs/openssl-3.4.1 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
dev-libs/popt-1.19-r1 | `nls -static-libs`
dev-python/certifi-3024.7.22 | `-test`
dev-python/charset-normalizer-3.4.2 | `-test`
dev-python/ensurepip-pip-25.1.1 | ``
dev-python/gentoo-common-1 | ``
dev-python/idna-3.10 | ` `
dev-python/jaraco-collections-5.2.1 | `-test`
dev-python/jaraco-context-6.0.1-r1 | `-test`
dev-python/jaraco-functools-4.2.1 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/more-itertools-10.7.0 | `-doc`
dev-python/packaging-25.0 | `-test`
dev-python/platformdirs-4.3.8 | `-test`
dev-python/pysocks-1.7.1-r2 | ` `
dev-python/requests-2.32.4 | `(test-rust) -socks5 -test`
dev-python/setuptools-80.9.0 | `-test`
dev-python/setuptools-scm-8.3.1 | `-test`
dev-python/trove-classifiers-2025.5.9.12 | `-test`
dev-python/urllib3-2.5.0 | `-brotli -http2 -test -zstd`
dev-python/wheel-0.45.1 | `-test`
dev-util/pkgconf-2.4.3 | `(native-symlinks) -test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r3 | `-perl -test`
media-libs/dav1d-1.5.0 | `8bit 10bit asm -test -xxhash`
media-libs/fontconfig-2.16.2-r1 | `nls -doc -test`
media-libs/freetype-2.13.3 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-11.2.1 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libass-0.17.1-r2 | `fontconfig -libunibreak -test -verify-sig`
media-libs/libpng-1.6.47 | `-apng -static-libs -test`
media-sound/lame-3.100-r3 | `frontend -debug -mp3rtp -sndfile -static-libs`
media-sound/madsonic-bin-7.0.10400 | `ffmpeg lame -systemd -xmp`
media-video/ffmpeg-7.1.1-r2 | `bzip2 dav1d drm fontconfig gnutls gpl libass postproc truetype xml zlib -`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
net-libs/gnutls-3.8.9-r1 | `cxx idn nls openssl tls-heartbeat zlib -brotli -dane -doc -examples -pkcs11 (-sslv2) (-sslv3) -static-libs -test (-test-full) -tools -verify-sig -zstd`
net-misc/rsync-3.4.1 | `acl iconv ssl xattr -examples -lz4 -rrsync -stunnel -system-zlib -verify-sig -xxhash -zstd`
sec-keys/openpgp-keys-gentoo-release-20240703 | `-test`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/baselayout-2.17 | `-build (-split-usr)`
sys-apps/baselayout-java-0.1.0-r3 | ``
sys-apps/coreutils-9.5 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -vanilla -verify-sig`
sys-apps/file-5.46-r2 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/findutils-4.10.0 | `nls (-selinux) -static -test -verify-sig`
sys-apps/gentoo-functions-0.19 | ``
sys-apps/hwdata-0.391 | ``
sys-apps/install-xattr-0.10-r1 | ``
sys-apps/portage-3.0.68 | `(ipc) native-extensions rsync-verify xattr -apidoc -build -doc -gentoo-dev (-selinux) -test`
sys-apps/sandbox-2.46 | `nnp`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -verify-sig`
sys-apps/util-linux-2.41.1 | `caps cramfs hardlink logger nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-devel/gcc-14.3.0 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran nls openmp (pie) sanitize ssp zstd -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite -hardened (-ieee-long-double) -jit (-libssp) -lto -modula2 (-multilib) -objc -objc`
sys-devel/gcc-config-2.12.1 | `(cc-wrappers) (native-symlinks)`
sys-kernel/linux-headers-6.12 | `-headers-only`
sys-libs/glibc-2.41-r4 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
sys-libs/libseccomp-2.6.0-r2 | `-debug -python -static-libs -test`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/ncurses-6.5_p20250329 | `cxx (tinfo) -ada -debug -doc -gpm -minimal -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.2_p13-r1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
x11-base/xorg-proto-2024.1 | `-test`
x11-libs/cairo-1.18.4-r1 | `glib -`
x11-libs/libdrm-2.4.125 | `-doc -test -tools -udev -valgrind`
x11-libs/libpciaccess-0.18.1 | `zlib`
x11-libs/libX11-1.8.12 | `-doc -test`
x11-libs/libXau-1.0.12 | `-doc`
x11-libs/libxcb-1.17.0 | `xkb -doc (-selinux) -test`
x11-libs/libXdmcp-1.1.5 | `-doc`
x11-libs/libXext-1.3.6 | `-doc`
x11-libs/libXfixes-6.0.1 | `-doc`
x11-libs/libXi-1.8.2 | `-doc`
x11-libs/libXrender-0.9.12 | ``
x11-libs/libXtst-1.2.5 | `-doc`
x11-libs/pixman-0.46.0 | `(-loongson2f) -static-libs -test`
x11-misc/compose-tables-1.8.12 | ``
x11-misc/shared-mime-info-2.4-r2 | `-test`
#### Inherited
Package | USE Flags
--------|----------
#### Purged
- [x] Headers
- [x] Static Libs
