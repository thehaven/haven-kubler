### haven/roonlegacy:dev

Built: Tue 23 Sep 16:58:44 BST 2025
Image Size: 796MB

#### Installed
Package | USE Flags
--------|----------
app-admin/perl-cleaner-2.31-r2 | `-pkgcore`
app-arch/libarchive-3.8.1 | `acl bzip2 e2fsprogs iconv lzma xattr zstd -blake2 -expat -lz4 -lzo -nettle -static-libs -test -verify-sig`
app-crypt/libmd-1.1.0 | ``
dev-lang/perl-5.40.2 | `-berkdb -doc -gdbm -minimal`
dev-libs/elfutils-0.193 | `bzip2 lzma nls utils -debuginfod -stacktrace -static-libs -test -valgrind -verify-sig -zstd`
dev-libs/fribidi-1.0.16 | `-doc -test`
dev-libs/glib-2.84.3 | `elf introspection mime xattr -dbus -debug -doc (-selinux) -static-libs -sysprof -systemtap -test -utils`
dev-libs/gobject-introspection-1.84.0-r1 | `-doctool -gtk-doc -test`
dev-libs/gobject-introspection-common-1.84.0 | ``
dev-libs/icu-77.1 | `-debug -doc -examples -static-libs -test -verify-sig`
dev-libs/libbsd-0.11.8 | `-static-libs -verify-sig`
dev-libs/libtasn1-4.20.0 | `-static-libs -test -verify-sig`
dev-libs/nettle-3.10.2 | `asm gmp -doc -static-libs -verify-sig`
dev-libs/popt-1.19-r1 | `nls -static-libs`
dev-perl/Parse-Yapp-1.210.0-r1 | `-examples -test`
dev-python/jaraco-collections-5.2.1 | `-test`
dev-python/jaraco-context-6.0.1-r1 | `-test`
dev-python/jaraco-functools-4.3.0 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/more-itertools-10.7.0 | `-doc`
dev-python/packaging-25.0 | `-test`
dev-python/platformdirs-4.3.8 | `-test`
dev-python/setuptools-80.9.0-r1 | `-test`
dev-python/setuptools-scm-8.3.1 | `-test`
dev-python/trove-classifiers-2025.8.26.11 | `-test`
dev-python/wheel-0.45.1 | `-test`
dev-util/pkgconf-2.5.1 | `(native-symlinks) -test`
media-fonts/liberation-fonts-2.1.5 | `-`
media-gfx/graphite2-1.3.14_p20210810-r3 | `-perl -test`
media-libs/alsa-lib-1.2.14 | `-debug -doc -python`
media-libs/alsa-topology-conf-1.2.5.1 | ``
media-libs/alsa-ucm-conf-1.2.14 | ``
media-libs/fdk-aac-2.0.3 | `-examples`
media-libs/fontconfig-2.16.2-r1 | `nls -doc -test`
media-libs/freetype-2.13.3 | `adobe-cff bzip2 cleartype-hinting png -`
media-libs/harfbuzz-11.2.1 | `cairo glib graphite introspection truetype -debug -doc -experimental -icu -test`
media-libs/libass-0.17.1-r2 | `fontconfig -libunibreak -test -verify-sig`
media-libs/libogg-1.3.5-r2 | `-static-libs`
media-libs/libpng-1.6.50-r1 | `-apng -static-libs -test`
media-libs/libsamplerate-0.2.2 | `-test`
media-libs/libvorbis-1.3.7-r2 | `-static-libs -test`
media-libs/opencore-amr-0.1.6 | ``
media-libs/opus-1.5.2 | `-custom-modes -debug -deep-plc -doc -dred -hardened -osce -static-libs -test`
media-libs/soxr-0.1.3-r2 | `-examples -test`
media-libs/vo-amrwbenc-0.1.3 | `-examples -static-libs`
media-sound/alsa-utils-1.2.14 | `libsamplerate nls -bat -doc -ieee1394 -ncurses (-selinux)`
media-video/ffmpeg-7.1.1-r2 | `amr amrenc bzip2 drm fdk fontconfig gnutls gpl libass libsoxr opus postproc truetype vorbis xml zlib -`
net-dns/bind-9.18.37-r1 | ``
net-fs/cifs-utils-7.0-r1 | `acl ads caps python -creds -pam -systemd`
net-fs/samba-4.22.3 | `acl regedit system-mitkrb5 -addc -ads -ceph -client -cluster -cups -debug (-fam) -glusterfs -gpg -iprint -json -ldap -llvm-libunwind -lmdb -pam -profiling-data -python -quota (-selinux) -snapper -spotlight -syslog (-system-heimdal) -systemd (-test) -unwind -winbind -zeroconf`
net-libs/gnutls-3.8.10 | `cxx idn nls openssl tls-heartbeat zlib -brotli -dane -doc -examples -pkcs11 (-sslv2) (-sslv3) -static-libs -test (-test-full) -tools -verify-sig -zstd`
perl-core/File-Temp-0.231.100-r1 | ` `
perl-core/Test-Harness-3.500.0 | `-test`
sys-apps/hwdata-0.398 | ``
sys-libs/liburing-2.9 | `-examples -static-libs -test`
sys-libs/talloc-2.4.3 | `python -compat -test -valgrind`
sys-libs/tdb-1.4.13 | `-python -test`
sys-libs/tevent-0.16.2 | `-python -test`
x11-libs/cairo-1.18.4-r1 | `glib -`
x11-libs/libdrm-2.4.125 | `-doc -test -tools -udev -valgrind`
x11-libs/libpciaccess-0.18.1 | `zlib`
x11-libs/pixman-0.46.0 | `(-loongson2f) -static-libs -test`
x11-misc/shared-mime-info-2.4-r2 | `-test`
#### Inherited
Package | USE Flags
--------|----------
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
