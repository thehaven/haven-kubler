### haven/yt-dlp:dev

Built: Wed 24 Sep 16:22:13 BST 2025
Image Size: 338MB

#### Installed
Package | USE Flags
--------|----------
dev-libs/elfutils-0.193 | `bzip2 lzma nls utils -debuginfod -stacktrace -static-libs -test -valgrind -verify-sig -zstd`
dev-libs/fribidi-1.0.16 | `-doc -test`
dev-libs/glib-2.84.3 | `elf introspection mime xattr -dbus -debug -doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gmp-6.3.0-r1 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/gobject-introspection-1.84.0-r1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.84.0 | ``
dev-libs/libtomcrypt-1.18.2-r4 | `gmp libtommath -tomsfastmath`
dev-libs/libtommath-1.3.0 | `-doc -examples -static-libs`
dev-libs/libxml2-2.13.9 | `python readline -examples -icu -lzma -static-libs -test`
dev-python/cffi-1.17.1 | `-debug -doc -test`
dev-python/ply-3.11-r2 | `-examples`
dev-python/pycparser-2.22 | `-test`
dev-python/pycryptodome-3.23.0 | `-debug`
dev-util/pkgconf-2.5.1 | `(native-symlinks) -test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r3 | `-perl -test`
media-libs/chromaprint-1.5.1-r4 | `-test -tools`
media-libs/dav1d-1.5.0 | `8bit 10bit asm -test -xxhash`
media-libs/fontconfig-2.16.2-r1 | `nls -doc -test`
media-libs/freetype-2.13.3 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-11.2.1 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libass-0.17.1-r2 | `fontconfig -libunibreak -test -verify-sig`
media-libs/libjpeg-turbo-3.1.1 | `-java -static-libs`
media-libs/libogg-1.3.5-r2 | `-static-libs`
media-libs/libpng-1.6.50-r1 | `-apng -static-libs -test`
media-libs/libtheora-1.2.0-r1 | `encode -doc -examples -static-libs`
media-libs/libvorbis-1.3.7-r2 | `-static-libs -test`
media-libs/libvpx-1.15.2 | `highbitdepth threads -doc -postproc -static-libs -test`
media-libs/libwebp-1.5.0 | `jpeg png -gif -opengl -static-libs -swap-16bit-csp -tiff`
media-libs/opus-1.5.2 | `-custom-modes -debug -deep-plc -doc -dred -hardened -osce -static-libs -test`
media-libs/soxr-0.1.3-r2 | `-examples -test`
media-libs/svt-av1-2.1.2 | ``
media-libs/x264-0.0.20240513 | `interlaced threads -opencl -static-libs`
media-video/ffmpeg-7.1.1-r2 | `bzip2 chromaprint dav1d fontconfig gpl libass librtmp libsoxr openssl opus postproc svt-av1 theora truetype vorbis vpx webp x264 xml zlib -`
media-video/rtmpdump-2.4_p20210219 | `ssl tools -gnutls -static-libs`
net-misc/aria2-1.37.0 | `libxml2 nettle nls ssl -adns -bittorrent (-gnutls) -jemalloc -libuv -metalink -scripts -sqlite -ssh -tcmalloc -test -xmlrpc`
net-misc/yt-dlp-2025.09.05 | `-test`
sci-libs/fftw-3.3.10-r1 | `openmp threads -doc -fortran -mpi -test (-zbus)`
x11-libs/cairo-1.18.4-r1 | `glib -`
x11-libs/pixman-0.46.0 | `(-loongson2f) -static-libs -test`
x11-misc/shared-mime-info-2.4-r2 | `-test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/python3** |
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-misc/mime-types-2.1.54 | `-nginx`
dev-db/sqlite-3.50.4 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/python-3.13.5_p1 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.1 | `unicode -examples -static-libs -test`
dev-libs/libffi-3.5.2 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.45 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-python/cachecontrol-0.14.3 | `-test`
dev-python/certifi-3024.7.22 | `-test`
dev-python/charset-normalizer-3.4.3 | `-test`
dev-python/colorama-0.4.6 | `-examples -test`
dev-python/dependency-groups-1.3.1 | `-test`
dev-python/distlib-0.4.0 | `-test`
dev-python/distro-1.9.0 | `-test`
dev-python/ensurepip-pip-25.2 | `(test-rust) -test`
dev-python/gentoo-common-1 | ``
dev-python/idna-3.10 | ` `
dev-python/jaraco-collections-5.2.1 | `-test`
dev-python/jaraco-context-6.0.1-r1 | `-test`
dev-python/jaraco-functools-4.3.0 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/linkify-it-py-2.0.3 | `-test`
dev-python/markdown-it-py-4.0.0 | `-test`
dev-python/mdurl-0.1.2 | `-test`
dev-python/more-itertools-10.7.0 | `-doc`
dev-python/msgpack-1.1.1 | `native-extensions -debug -test`
dev-python/packaging-25.0 | `-test`
dev-python/pip-25.2 | `(test-rust) -test`
dev-python/platformdirs-4.3.8 | `-test`
dev-python/pygments-2.19.2 | `-test`
dev-python/pyproject-hooks-1.2.0 | `-test`
dev-python/pysocks-1.7.1-r2 | ` `
dev-python/requests-2.32.5 | `(test-rust) -socks5 -test`
dev-python/resolvelib-1.2.0 | `-test`
dev-python/rich-14.1.0 | `-test`
dev-python/setuptools-80.9.0-r1 | `-test`
dev-python/setuptools-scm-8.3.1 | `-test`
dev-python/tomli-w-1.2.0 | `-test`
dev-python/trove-classifiers-2025.8.26.11 | `-test`
dev-python/truststore-0.10.4 | `-test`
dev-python/typing-extensions-4.14.1 | `-test`
dev-python/uc-micro-py-1.0.3 | `-test`
dev-python/urllib3-2.5.0 | `-brotli -http2 -test -zstd`
dev-python/wheel-0.45.1 | `-test`
sys-apps/util-linux-2.41.1-r1 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
**FROM haven/bash** |
app-admin/eselect-1.4.30 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/xz-utils-5.8.1-r1 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.7-r1 | `lzma zlib -lz4 -static-libs -test`
app-portage/portage-utils-0.97 | `-openmp -qmanifest -static`
app-shells/bash-5.3_p3-r2 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.34.5 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.65.0-r2 | `-debug -hpack-tools -jemalloc -systemd -test -utils -xml`
net-libs/nghttp3-1.9.0 | ``
net-misc/curl-8.15.0 | `adns alt-svc ftp hsts http2 http3 httpsrr imap openssl pop3 psl quic smtp ssl tftp websockets -brotli -debug (-ech) -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp (-rustls) -samba -sasl-scram -ssh -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.7 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -vanilla -verify-sig`
sys-apps/file-5.46-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -test-full -verify-sig`
sys-kernel/linux-headers-6.12 | `-headers-only`
sys-libs/libseccomp-2.6.0-r2 | `-debug -python -static-libs -test`
sys-libs/ncurses-6.5_p20250802 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.3_p1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.4.2 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.7 | `-test`
dev-lang/execline-2.9.7.0 | ``
dev-libs/skalibs-2.14.4.0 | ``
sys-apps/s6-2.13.2.0 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.41-r6 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
