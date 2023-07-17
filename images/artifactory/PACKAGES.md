### haven/artifactory:dev

Built: Mon 17 Jul 13:00:19 BST 2023
Image Size: 1.75GB

#### Installed
Package | USE Flags
--------|----------
app-shells/bash-5.1_p16-r6 | ``
dev-db/sqlite-3.42.0 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-util/artifactory-pro-bin-7.12.6 | `ssl`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/jdk-openjdk-11** |
app-crypt/p11-kit-0.24.1-r1 | `asn1 libffi trust -debug -systemd`
app-eselect/eselect-java-0.5.0 | ``
dev-java/java-config-2.3.1-r1 | `-test`
dev-java/openjdk-bin-11.0.18_p10 | `headless-awt -alsa -cups (-selinux) -source`
dev-libs/elfutils-0.188 | `bzip2 nls utils -lzma -static-libs -test -verify-sig -zstd`
dev-libs/expat-2.5.0 | `unicode -examples -static-libs -test`
dev-libs/glib-2.76.3 | `elf mime xattr -dbus -debug -gtk-doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gobject-introspection-1.76.1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.76.1 | ``
dev-libs/libffi-3.4.4-r1 | `-debug (-exec-static-trampoline) -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.42-r1 | `bzip2 pcre16 readline (split-usr) unicode zlib -jit -libedit -pcre32 -static-libs -valgrind -verify-sig`
dev-libs/libtasn1-4.19.0 | `-static-libs -test -verify-sig`
dev-libs/libxml2-2.11.4 | `ftp python readline -debug -examples -icu -lzma -static-libs -test`
dev-libs/lzo-2.10 | `(split-usr) -examples -static-libs`
dev-util/pkgconf-1.8.1 | `-test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r3 | `-perl -test`
media-libs/fontconfig-2.14.2-r2 | `nls -doc -test`
media-libs/freetype-2.13.0 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-7.3.0 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libpng-1.6.39 | `-apng -static-libs`
sys-apps/baselayout-java-0.1.0-r2 | ``
sys-apps/util-linux-2.38.1-r2 | `cramfs hardlink nls readline (split-usr) suid (unicode) -audit -build -caps -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -tty-helpers -udev -verify-sig`
sys-libs/libxcrypt-4.4.33 | `(compat) (split-usr) (system) -headers-only -static-libs -test`
x11-libs/cairo-1.17.8 | `glib -`
x11-libs/pixman-0.42.2 | `(-loongson2f) -static-libs -test`
x11-misc/shared-mime-info-2.2 | `-test`
**FROM haven/bash** |
app-admin/eselect-1.4.25 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference (split-usr) -lbzip2 -pbzip2`
app-arch/bzip2-1.0.8-r4 | `(split-usr) -static -static-libs -verify-sig`
app-portage/portage-utils-0.96-r1 | `openmp -qmanifest -qtegrity -static`
app-shells/bash-5.1_p16-r6 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins -verify-sig`
dev-libs/gmp-6.2.1-r5 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpfr-4.2.0_p9 | `-static-libs -verify-sig`
net-dns/c-ares-1.19.1 | `-static-libs -test -verify-sig`
net-libs/nghttp2-1.51.0 | `-cxx -debug -hpack-tools -jemalloc -static-libs -test -utils -xml`
net-misc/curl-8.0.1 | `adns ftp http2 imap openssl pop3 progress-meter smtp ssl tftp -alt-svc -brotli -gnutls -gopher -hsts -idn -kerberos -ldap -mbedtls (-nghttp3) -nss -rtmp (-rustls) -samba -ssh (-sslv3) -static-libs -telnet -test -verify-sig -websockets -zstd`
sys-apps/acl-2.3.1-r1 | `nls (split-usr) -static-libs`
sys-apps/attr-2.5.1-r2 | `nls (split-usr) -debug -static-libs`
sys-apps/coreutils-9.3-r2 | `acl nls openssl (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla -verify-sig`
sys-apps/file-5.44-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/findutils-4.9.0-r2 | `nls (-selinux) -static -test -verify-sig`
sys-apps/gentoo-functions-0.19 | ``
sys-apps/sed-4.9 | `acl nls (-selinux) -static -verify-sig`
sys-devel/gcc-12.3.1_p20230526 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran hardened nls nptl openmp (pie) sanitize (ssp) -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite (-ieee-long-double) -jit (-libssp) -lto (-multilib) -objc -objc`
sys-devel/gcc-config-2.11 | `(cc-wrappers) (native-symlinks)`
sys-kernel/linux-headers-6.1 | `-headers-only`
sys-libs/libseccomp-2.5.4 | `(-experimental-loong) -python -static-libs -test`
sys-libs/ncurses-6.4_p20230401 | `cxx minimal (split-usr) (tinfo) -ada -debug -doc -gpm -profile (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.2.13-r1 | `(split-usr) -minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20230311.3.90 | `-cacert`
dev-libs/openssl-3.0.9-r1 | `asm -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
sys-apps/debianutils-5.7 | `installkernel -static`
sys-kernel/installkernel-gentoo-7 | `-grub`
**FROM haven/s6** |
app-admin/entr-5.3-r1 | `-test`
dev-lang/execline-2.9.3.0 | ``
dev-libs/skalibs-2.13.1.1 | ``
sys-apps/s6-2.11.3.2 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.1-r1 | `-doc -static-libs`
net-dns/libidn2-2.3.4 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.37-r3 | `cet multiarch (ssp) (static-libs) -audit -caps -compile-locales (-crypt) (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/timezone-data-2023c | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
