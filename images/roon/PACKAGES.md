### haven/roon:dev

Built: Sat 14 Dec 21:11:17 GMT 2024
Image Size: 603MB

#### Installed
Package | USE Flags
--------|----------
app-admin/perl-cleaner-2.31-r2 | `-pkgcore`
app-arch/libarchive-3.7.7 | `acl bzip2 e2fsprogs iconv lzma xattr zstd -blake2 -expat -lz4 -lzo -nettle -static-libs -test -verify-sig`
app-crypt/libmd-1.1.0 | ``
dev-db/lmdb-0.9.33 | `-static-libs`
dev-lang/perl-5.40.0 | `-berkdb -doc -gdbm -minimal`
dev-libs/icu-74.2 | `-debug -doc -examples -static-libs -test -verify-sig`
dev-libs/libbsd-0.11.8 | `-static-libs -verify-sig`
dev-libs/libtasn1-4.19.0 | `-static-libs -test -verify-sig`
dev-libs/nettle-3.10 | `asm gmp -doc -static-libs -verify-sig`
dev-libs/popt-1.19-r1 | `nls -static-libs`
dev-perl/Parse-Yapp-1.210.0-r1 | `-examples -test`
media-libs/alsa-lib-1.2.12 | `-alisp -debug -doc -python`
media-libs/alsa-topology-conf-1.2.5.1 | ``
media-libs/alsa-ucm-conf-1.2.12 | ``
media-libs/fdk-aac-2.0.3 | `-examples`
media-libs/libogg-1.3.5-r1 | `-static-libs`
media-libs/libsamplerate-0.2.2 | `-test`
media-libs/libvorbis-1.3.7-r1 | `-static-libs -test`
media-libs/opencore-amr-0.1.6 | ``
media-libs/vo-amrwbenc-0.1.3 | `-examples -static-libs`
media-sound/alsa-utils-1.2.12 | `libsamplerate nls -bat -doc -ieee1394 -ncurses (-selinux)`
media-sound/lame-3.100-r3 | `frontend -debug -mp3rtp -sndfile -static-libs`
media-video/ffmpeg-6.1.2 | `amr amrenc bzip2 cpudetection encode fdk gnutls gpl iconv mp3 network pic postproc threads vorbis zlib -`
net-dns/bind-9.18.31-r1 | ``
net-fs/cifs-utils-7.0-r1 | `acl ads caps python -creds -pam -systemd`
net-fs/samba-4.19.7 | `acl regedit system-mitkrb5 -addc -ads -ceph -client -cluster -cups -debug (-fam) -glusterfs -gpg -iprint -json -ldap -llvm-libunwind -pam -profiling-data -python -quota (-selinux) -snapper -spotlight -syslog (-system-heimdal) -systemd (-test) -unwind -winbind -zeroconf`
net-libs/gnutls-3.8.7.1-r1 | `cxx idn nls openssl seccomp tls-heartbeat zlib -brotli -dane -doc -examples -pkcs11 (-sslv2) (-sslv3) -static-libs -test (-test-full) -tools -verify-sig -zstd`
perl-core/File-Temp-0.231.100-r1 | ` `
perl-core/Test-Harness-3.500.0 | `-test`
sys-libs/ldb-2.8.1 | `lmdb -doc -ldap -python -test`
sys-libs/liburing-2.7-r1 | `-examples -static-libs -test`
sys-libs/talloc-2.4.2 | `python -compat -test -valgrind`
sys-libs/tdb-1.4.10 | `-python -test`
sys-libs/tevent-0.16.1 | `-python -test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/bash** |
app-admin/eselect-1.4.27-r1 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/xz-utils-5.6.3 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.6 | `lzma zlib -lz4 -static-libs -test`
app-portage/portage-utils-0.97 | `-openmp -qmanifest -static`
app-shells/bash-5.2_p37 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.33.1 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.62.1 | `-debug -hpack-tools -jemalloc -static-libs -systemd -test -utils -xml`
net-libs/nghttp3-1.6.0 | `-static-libs -test`
net-misc/curl-8.10.1-r1 | `adns alt-svc ftp hsts http2 http3 imap openssl pop3 progress-meter psl quic smtp ssl tftp websockets -brotli -debug -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp (-rustls) -samba -ssh (-sslv3) -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r1 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.5 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -vanilla -verify-sig`
sys-apps/file-5.45-r4 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -verify-sig`
sys-kernel/linux-headers-6.6-r1 | `-headers-only`
sys-libs/libseccomp-2.5.5-r2 | `-debug (-experimental-loong) -python -static-libs -test`
sys-libs/ncurses-6.4_p20240414 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.2_p13-r1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.3.2-r1 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.6 | `-test`
dev-lang/execline-2.9.6.0 | ``
dev-libs/skalibs-2.14.2.0 | ``
sys-apps/s6-2.13.0.0 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.2 | `-doc -static-libs`
net-dns/libidn2-2.3.7 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.40-r5 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libxcrypt-4.4.36-r3 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2024a-r1 | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
