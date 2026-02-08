### haven/yt-dlp:dev

Built: Sun  8 Feb 13:15:17 GMT 2026
Image Size: 560MB

#### Installed
Package | USE Flags
--------|----------
dev-lang/deno-bin-2.6.8 | ``
dev-libs/elfutils-0.194 | `bzip2 lzma nls utils -debuginfod -libarchive -stacktrace -static-libs -test -valgrind -verify-sig -zstd`
dev-libs/fribidi-1.0.16 | `-doc -test`
dev-libs/glib-2.84.4-r1 | `elf introspection mime xattr -dbus -debug -doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gmp-6.3.0-r1 | `asm cpudetection cxx -doc -pic -static-libs -verify-sig`
dev-libs/gobject-introspection-1.84.0-r1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.84.0 | ``
dev-libs/libtomcrypt-1.18.2-r4 | `gmp libtommath -tomsfastmath`
dev-libs/libtommath-1.3.0 | `-doc -examples -static-libs`
dev-libs/libxml2-2.15.1 | `readline -doc -icu -python -static-libs -test`
dev-python/cffi-2.0.0 | `-debug -doc -test`
dev-python/ply-3.11-r2 | `-examples`
dev-python/pycparser-3.0 | `-test`
dev-python/pycryptodome-3.23.0 | `-debug`
dev-python/yt-dlp-ejs-0.3.2 | ` `
dev-util/pkgconf-2.5.1 | `(native-symlinks) -test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r5 | `-perl -test`
media-libs/chromaprint-1.6.0-r1 | `-test -tools`
media-libs/dav1d-1.5.1 | `8bit 10bit asm -test -xxhash`
media-libs/fdk-aac-2.0.3 | `-examples`
media-libs/fontconfig-2.17.1 | `nls -doc -test`
media-libs/freetype-2.14.1-r1 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-12.3.2 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libaom-3.12.1 | `examples (-big-endian) -debug -doc -test`
media-libs/libass-0.17.4 | `fontconfig -libunibreak -test -verify-sig`
media-libs/libjpeg-turbo-3.1.3 | `-java -static-libs -test -verify-sig`
media-libs/libogg-1.3.6 | `-static-libs`
media-libs/libpng-1.6.54 | `-apng -static-libs -test`
media-libs/libtheora-1.2.0-r1 | `encode -doc -examples -static-libs`
media-libs/libva-2.23.0 | `-`
media-libs/libvorbis-1.3.7-r2 | `-static-libs -test`
media-libs/libvpx-1.15.2 | `highbitdepth threads -doc -postproc -static-libs -test`
media-libs/libwebp-1.6.0 | `jpeg png -gif -opengl -static-libs -swap-16bit-csp -tiff`
media-libs/mutagen-1.47.0 | `-doc -test`
media-libs/openh264-2.6.0 | `plugin -test -utils`
media-libs/opus-1.6.1 | `-custom-modes -debug -deep-plc -doc -dred -hardened -osce -static-libs -test`
media-libs/svt-av1-3.1.2 | `-test`
media-libs/x264-0.0.20240513 | `interlaced threads -opencl -static-libs`
media-libs/x265-4.1 | `10bit 12bit -numa -test -vmaf`
media-libs/xvid-1.3.7-r2 | `-examples`
media-sound/lame-3.100-r3 | `frontend -debug -mp3rtp -sndfile -static-libs`
media-video/atomicparsley-0.9.6_p20210715_p151551 | ``
media-video/ffmpeg-8.0.1 | `bzip2 chromaprint dav1d drm fdk fontconfig gnutls gpl lame libaom libass lzma openh264 openssl opus svt-av1 theora truetype vaapi vdpau vorbis vpx webp x264 x265 xml xvid zlib -`
net-misc/aria2-1.37.0 | `libxml2 nettle nls ssl -adns -bittorrent (-gnutls) -jemalloc -libuv -metalink -scripts -sqlite -ssh -tcmalloc -test -xmlrpc`
net-misc/yt-dlp-2026.02.04 | `deno -test`
sci-libs/fftw-3.3.10-r1 | `openmp threads -doc -fortran -mpi -test (-zbus)`
sys-apps/hwdata-0.400 | ``
x11-base/xorg-proto-2025.1 | `-test`
x11-libs/cairo-1.18.4-r1 | `glib -`
x11-libs/libX11-1.8.13 | `-doc -test`
x11-libs/libXau-1.0.12 | `-doc`
x11-libs/libXdmcp-1.1.5 | `-doc`
x11-libs/libdrm-2.4.131 | `-doc -test -tools -udev -valgrind`
x11-libs/libpciaccess-0.18.1 | `zlib`
x11-libs/libvdpau-1.5 | `-doc -dri -test`
x11-libs/libxcb-1.17.0 | `xkb -doc (-selinux) -test`
x11-libs/pixman-0.46.4 | `(-loongson2f) -static-libs -test`
x11-misc/compose-tables-1.8.13 | ``
x11-misc/shared-mime-info-2.4-r3 | `-test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/python3** |
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-misc/mime-types-2.1.54 | `-nginx`
dev-db/sqlite-3.51.2 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/python-3.13.12 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-3.14.3 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo (-tail-call-interp) -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.4 | `unicode -examples -static-libs -test`
dev-libs/libffi-3.5.2 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.47 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-python/cachecontrol-0.14.3 | `-test`
dev-python/certifi-3024.7.22 | `-test`
dev-python/charset-normalizer-3.4.4-r1 | `native-extensions -debug -test -verify-provenance`
dev-python/colorama-0.4.6 | `-examples -test`
dev-python/dependency-groups-1.3.1 | `-test`
dev-python/distlib-0.4.0 | `-test`
dev-python/distro-1.9.0 | `-test`
dev-python/ensurepip-pip-26.0.1 | `(test-rust) -test`
dev-python/gentoo-common-1 | ``
dev-python/idna-3.11 | ` `
dev-python/jaraco-context-6.1.0 | `-test`
dev-python/jaraco-functools-4.4.0 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/linkify-it-py-2.0.3 | `-test`
dev-python/markdown-it-py-4.0.0 | `-test`
dev-python/mdurl-0.1.2 | `-test`
dev-python/more-itertools-10.8.0 | `-doc`
dev-python/msgpack-1.1.2 | `native-extensions -debug -test`
dev-python/packaging-26.0 | `-test -verify-provenance`
dev-python/pip-26.0.1 | `(test-rust) -test`
dev-python/platformdirs-4.5.1 | `-test -verify-provenance`
dev-python/pygments-2.19.2 | `-test`
dev-python/pyproject-hooks-1.2.0 | `-test`
dev-python/pysocks-1.7.1-r2 | ` `
dev-python/requests-2.32.5 | `(test-rust) -socks5 -test`
dev-python/resolvelib-1.2.1 | `-test`
dev-python/rich-14.3.2 | `-test`
dev-python/setuptools-81.0.0 | `-test`
dev-python/setuptools-scm-9.2.2 | `-test -verify-provenance`
dev-python/tomli-w-1.2.0 | `-test`
dev-python/trove-classifiers-2026.1.14.14 | `-test -verify-provenance`
dev-python/truststore-0.10.4 | `-test`
dev-python/typing-extensions-4.15.0 | `-test`
dev-python/uc-micro-py-1.0.3 | `-test`
dev-python/urllib3-2.6.3 | `-brotli -http2 -test -verify-provenance -zstd`
dev-python/wheel-0.46.3 | `-test -verify-provenance`
sys-apps/util-linux-2.41.3 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
**FROM haven/bash** |
app-admin/eselect-1.4.31 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/xz-utils-5.8.2 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.7-r1 | `lzma zlib -lz4 -static-libs -test -verify-sig`
app-portage/portage-utils-0.97.1 | `-openmp -qmanifest -static`
app-shells/bash-5.3_p9 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.34.6 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.68.0 | `-debug -hpack-tools -jemalloc -systemd -test -utils -verify-sig -xml`
net-libs/nghttp3-1.15.0 | `-verify-sig`
net-misc/curl-8.18.0 | `adns alt-svc ftp hsts http2 http3 httpsrr imap openssl pop3 psl quic smtp ssl tftp websockets -brotli -debug -ech -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp -rustls -samba -sasl-scram -ssh -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.10 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -test-full -vanilla -verify-sig`
sys-apps/file-5.46-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -test-full -verify-sig`
sys-libs/libseccomp-2.6.0-r3 | `-debug -python -static-libs -test -verify-sig`
sys-libs/ncurses-6.5_p20251220 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.3_p3 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.5.5 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.7 | `-test`
dev-lang/execline-2.9.8.1 | ``
dev-libs/skalibs-2.14.5.1 | ``
sys-apps/s6-2.14.0.1 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.43 | `cet multiarch ssp (static-libs) -audit -caps (-clang) -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) -sframe (-stack-realign) -suid -systemd -systemtap -test (-vanilla) -verify-sig`
sys-libs/libxcrypt-4.4.38-r1 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025c | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
