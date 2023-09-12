### haven/madsonic:dev

Built: Tue 12 Sep 12:11:38 BST 2023
Image Size: 1.2GB

#### Installed
Package | USE Flags
--------|----------
acct-group/portage-0-r1 | ``
acct-user/portage-0-r2 | ``
app-admin/eselect-1.4.26 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference (split-usr) -lbzip2 -pbzip2`
app-alternatives/tar-0 | `gnu (split-usr) -libarchive`
app-arch/bzip2-1.0.8-r4 | `(split-usr) -static -static-libs -verify-sig`
app-arch/tar-1.35 | `acl nls (xattr) -minimal (-selinux) -verify-sig`
app-arch/xz-utils-5.4.3 | `extra-filters nls (split-usr) -doc -static-libs -verify-sig`
app-arch/zstd-1.5.5 | `lzma (split-usr) zlib -lz4 -static-libs -test`
app-crypt/gnupg-2.2.41 | `bzip2 nls readline smartcard ssl -doc -ldap (-selinux) -test -tofu -tools -usb -user-socket -verify-sig -wks-server`
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-crypt/p11-kit-0.25.0-r1 | `libffi nls -gtk-doc -systemd -test`
app-crypt/pinentry-1.2.1-r3 | `ncurses -`
app-eselect/eselect-java-0.5.0 | ``
app-misc/ca-certificates-20230311.3.90 | `-cacert`
app-misc/mime-types-2.1.53 | `-nginx`
app-misc/pax-utils-1.3.5 | `man -caps -python (-seccomp) -test`
app-portage/gemato-20.4 | `gpg -pretty-log -test -tools`
app-shells/bash-5.1_p16-r6 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins -verify-sig`
dev-db/sqlite-3.42.0 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-java/java-config-2.3.1-r1 | `-test`
dev-java/openjdk-bin-17.0.6_p10 | `-alsa -cups -headless-awt (-selinux) -source`
dev-lang/python-3.11.5 | `ensurepip readline sqlite ssl -bluetooth -build -debug -examples -gdbm -libedit -lto -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/elfutils-0.189-r1 | `bzip2 nls utils -lzma -static-libs -test -verify-sig -zstd`
dev-libs/expat-2.5.0 | `unicode -examples -static-libs -test`
dev-libs/glib-2.76.4 | `elf mime xattr -dbus -debug -gtk-doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gmp-6.3.0 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/gobject-introspection-1.76.1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.76.1 | ``
dev-libs/libassuan-2.5.6 | `-verify-sig`
dev-libs/libffi-3.4.4-r1 | `-debug (-exec-static-trampoline) -pax-kernel -static-libs -test`
dev-libs/libgcrypt-1.10.1-r3 | `asm getentropy -doc -static-libs -verify-sig`
dev-libs/libgpg-error-1.47 | `nls -common-lisp -static-libs -test -verify-sig`
dev-libs/libksba-1.6.4 | `-static-libs -verify-sig`
dev-libs/libpcre2-10.42-r1 | `bzip2 pcre16 readline (split-usr) unicode zlib -jit -libedit -pcre32 -static-libs -valgrind -verify-sig`
dev-libs/libtasn1-4.19.0 | `-static-libs -test -verify-sig`
dev-libs/libunistring-1.1-r1 | `-doc -static-libs`
dev-libs/libxml2-2.11.4 | `ftp python readline -debug -examples -icu -lzma -static-libs -test`
dev-libs/lzo-2.10 | `(split-usr) -examples -static-libs`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpfr-4.2.0_p12 | `-static-libs -verify-sig`
dev-libs/nettle-3.9.1 | `asm gmp -doc -static-libs -verify-sig`
dev-libs/npth-1.6-r1 | `-test`
dev-libs/openssl-3.0.10 | `asm -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
dev-libs/popt-1.19 | `nls -static-libs`
dev-python/certifi-3021.3.16-r3 | `-test`
dev-python/charset-normalizer-3.2.0 | `-test`
dev-python/ensurepip-pip-23.2.1 | ``
dev-python/ensurepip-setuptools-68.0.0 | ``
dev-python/ensurepip-wheels-100 | ``
dev-python/gentoo-common-1 | ``
dev-python/idna-3.4 | `-test`
dev-python/jaraco-context-4.3.0 | `-test`
dev-python/jaraco-functools-3.9.0 | `-test`
dev-python/jaraco-text-3.11.1-r1 | `-test`
dev-python/more-itertools-10.1.0 | `-doc -test`
dev-python/nspektr-0.5.0 | `-test`
dev-python/ordered-set-4.1.0 | `-test`
dev-python/packaging-23.1 | `-test`
dev-python/platformdirs-3.10.0 | `-test`
dev-python/pyparsing-3.1.1 | `-examples -test`
dev-python/PySocks-1.7.1-r2 | ` `
dev-python/requests-2.31.0 | `(test-rust) -socks5 -test`
dev-python/setuptools-68.0.0-r1 | `-test`
dev-python/setuptools-scm-7.1.0 | `-test`
dev-python/tomli-2.0.1-r1 | `-test`
dev-python/typing-extensions-4.7.1 | `-test`
dev-python/urllib3-2.0.4 | `-brotli -test -zstd`
dev-python/wheel-0.41.1 | `-test`
dev-util/pkgconf-1.8.1 | `-test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r3 | `-perl -test`
media-libs/dav1d-1.2.1 | `8bit 10bit asm -test -xxhash`
media-libs/fontconfig-2.14.2-r2 | `nls -doc -test`
media-libs/freetype-2.13.0 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-8.0.1 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libpng-1.6.40-r1 | `-apng -static-libs`
media-sound/lame-3.100-r3 | `frontend -debug -mp3rtp -sndfile -static-libs`
media-sound/madsonic-bin-7.0.10400 | `ffmpeg lame -systemd -xmp`
media-video/ffmpeg-4.4.4-r3 | `bzip2 dav1d encode gnutls gpl iconv mp3 network postproc threads zlib -`
net-dns/c-ares-1.19.1 | `-static-libs -test -verify-sig`
net-dns/libidn2-2.3.4 | `nls -static-libs -verify-sig`
net-libs/gnutls-3.8.0 | `cxx idn nls openssl seccomp tls-heartbeat zlib -brotli -dane -doc -examples -pkcs11 (-sslv2) (-sslv3) -static-libs -test (-test-full) -tools -verify-sig -zstd`
net-libs/nghttp2-1.51.0 | `-cxx -debug -hpack-tools -jemalloc -static-libs -test -utils -xml`
net-misc/curl-8.1.2 | `adns ftp http2 imap openssl pop3 progress-meter smtp ssl tftp -alt-svc -brotli -gnutls -gopher -hsts -idn -kerberos -ldap -mbedtls (-nghttp3) -nss -rtmp (-rustls) -samba -ssh (-sslv3) -static-libs -telnet -test -verify-sig -websockets -zstd`
net-misc/rsync-3.2.7-r2 | `acl iconv ssl xattr -examples -lz4 -rrsync -stunnel -system-zlib -verify-sig -xxhash -zstd`
sec-keys/openpgp-keys-gentoo-release-20230329 | `-test`
sys-apps/acl-2.3.1-r2 | `nls (split-usr) -static-libs`
sys-apps/attr-2.5.1-r2 | `nls (split-usr) -debug -static-libs`
sys-apps/baselayout-2.14 | `(split-usr) -build`
sys-apps/baselayout-java-0.1.0-r2 | ``
sys-apps/coreutils-9.3-r3 | `acl nls openssl (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla -verify-sig`
sys-apps/debianutils-5.8 | `installkernel -static`
sys-apps/file-5.45-r1 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/findutils-4.9.0-r2 | `nls (-selinux) -static -test -verify-sig`
sys-apps/gentoo-functions-0.19 | ``
sys-apps/install-xattr-0.8 | ``
sys-apps/portage-3.0.49-r2 | `(ipc) native-extensions rsync-verify (xattr) -apidoc -build -debug -doc -gentoo-dev (-selinux) -test`
sys-apps/sandbox-2.37 | `nnp`
sys-apps/sed-4.9 | `acl nls (-selinux) -static -verify-sig`
sys-apps/util-linux-2.38.1-r2 | `caps cramfs hardlink logger nls readline (split-usr) suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -verify-sig`
sys-devel/gcc-12.3.1_p20230526 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran hardened nls nptl openmp (pie) sanitize (ssp) -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite (-ieee-long-double) -jit (-libssp) -lto (-multilib) -objc -objc`
sys-devel/gcc-config-2.11 | `(cc-wrappers) (native-symlinks)`
sys-kernel/installkernel-gentoo-7 | `-grub`
sys-kernel/linux-headers-6.1 | `-headers-only`
sys-libs/glibc-2.37-r3 | `cet multiarch (ssp) (static-libs) -audit -caps -compile-locales (-crypt) (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libcap-ng-0.8.3 | `-python -static-libs`
sys-libs/libseccomp-2.5.4 | `(-experimental-loong) -python -static-libs -test`
sys-libs/libxcrypt-4.4.36 | `(compat) (split-usr) (system) -headers-only -static-libs -test`
sys-libs/ncurses-6.4_p20230401 | `cxx (split-usr) (tinfo) -ada -debug -doc -gpm -minimal -profile (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
sys-libs/timezone-data-2023c | `nls -leaps-timezone -zic-slim`
sys-libs/zlib-1.2.13-r1 | `(split-usr) -minizip -static-libs -verify-sig`
x11-libs/cairo-1.17.8 | `glib -`
x11-libs/libX11-1.8.6 | `-doc -test`
x11-libs/libXau-1.0.11 | `-doc`
x11-libs/libxcb-1.15-r1 | `xkb -doc (-selinux) -test`
x11-libs/libXdmcp-1.1.4-r2 | `-doc`
x11-libs/libXext-1.3.5 | `-doc`
x11-libs/libXfixes-6.0.1 | `-doc`
x11-libs/libXi-1.8.1 | `-doc`
x11-libs/libXrender-0.9.11 | ``
x11-libs/libXtst-1.2.4 | `-doc`
x11-libs/pixman-0.42.2 | `(-loongson2f) -static-libs -test`
x11-misc/compose-tables-1.8.6 | ``
x11-misc/shared-mime-info-2.2 | `-test`
#### Inherited
Package | USE Flags
--------|----------
#### Purged
- [x] Headers
- [x] Static Libs
