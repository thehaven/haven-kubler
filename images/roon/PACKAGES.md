### haven/roon:dev

Built: Thu 13 May 11:19:50 BST 2021
Image Size: 414MB




#### Installed
Package | USE Flags
--------|----------
app-admin/perl-cleaner-2.27 | ``
app-arch/libarchive-3.5.1 | `acl bzip2 e2fsprogs iconv lzma threads xattr zlib -blake2 -expat (-libressl) -lz4 -lzo -nettle -static-libs -zstd`
app-arch/xz-utils-5.2.5 | `extra-filters nls (split-usr) threads -static-libs`
app-crypt/mit-krb5-1.18.2-r3 | `keyutils nls pkinit threads -doc (-libressl) -lmdb -openldap (-selinux) -test -xinetd`
app-eselect/eselect-python-20200719 | ``
app-misc/mime-types-9 | ``
dev-db/lmdb-0.9.28 | `-static-libs`
dev-db/sqlite-3.34.1 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/perl-5.30.3 | `-berkdb -debug -doc -gdbm -ithreads`
dev-lang/python-3.8.8_p1 | `hardened readline sqlite ssl xml -bluetooth -build -examples -gdbm -ipv6 (-libressl) -ncurses -test -tk -verify-sig -wininst`
dev-lang/python-exec-2.4.6-r4 | `(native-symlinks)`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.2.10 | `(split-usr) unicode -examples -static-libs`
dev-libs/icu-68.2 | `-debug -doc -examples -static-libs`
dev-libs/libbsd-0.10.0 | `-static-libs`
dev-libs/libev-4.33 | `-static-libs`
dev-libs/libffi-3.3-r2 | `-debug -pax`
dev-libs/libltdl-2.4.6 | `-static-libs`
dev-libs/libtasn1-4.16.0 | `-doc -static-libs -test -valgrind`
dev-libs/libuv-1.40.0 | `-static-libs`
dev-libs/libverto-0.3.1-r1 | `libev threads -glib -libevent -static-libs -tevent`
dev-libs/libxml2-2.9.10-r5 | `python readline -debug -examples -icu -ipv6 -lzma -static-libs -test`
dev-libs/nettle-3.7.2 | `asm gmp -doc -static-libs -test`
dev-libs/popt-1.18 | `nls -static-libs`
dev-perl/Parse-Yapp-1.210.0 | `-examples`
dev-python/certifi-10001-r1 | `-test`
dev-python/extras-1.0.0-r1 | `-test`
dev-python/fixtures-3.0.0-r1 | `-test`
dev-python/linecache2-1.0.0-r1 | `-test`
dev-python/pbr-5.5.1 | `-test`
dev-python/pyrsistent-0.17.3 | `-test`
dev-python/python-mimeparse-1.6.0-r3 | ` `
dev-python/setuptools-54.1.1 | `-test`
dev-python/setuptools_scm-6.0.1 | `-test`
dev-python/six-1.15.0-r1 | `-doc -test`
dev-python/subunit-1.4.0 | `-static-libs -test`
dev-python/testtools-2.4.0-r1 | `-doc -test`
dev-python/traceback2-1.4.0-r1 | `-test`
dev-python/unittest2-1.1.0-r1 | `-test`
dev-util/cmocka-1.1.5 | `-doc -examples -static-libs -test`
media-libs/alsa-lib-1.2.3.2-r1 | `thread-safety -alisp -debug -doc -python`
media-libs/alsa-topology-conf-1.2.3 | ``
media-libs/alsa-ucm-conf-1.2.3 | ``
media-libs/dav1d-0.8.2 | `10bit 8bit asm`
media-libs/libogg-1.3.4 | `-static-libs`
media-libs/libsamplerate-0.2.1 | `-test`
media-libs/libvorbis-1.3.7 | `-static-libs -test`
media-sound/alsa-utils-1.2.3 | `libsamplerate nls -bat -doc -ncurses (-selinux)`
media-sound/lame-3.100-r3 | `frontend -debug -mp3rtp -sndfile -static-libs`
media-video/ffmpeg-4.3.2 | `bzip2 cpudetection dav1d encode gnutls gpl iconv mp3 network postproc threads vorbis zlib -`
net-dns/bind-tools-9.16.12 | `caps readline -doc -gssapi -idn -ipv6 -libedit (-libressl) -xml`
net-fs/cifs-utils-6.11 | `acl ads caps -creds -pam -systemd`
net-fs/samba-4.12.9-r1 | `acl regedit system-mitkrb5 -addc -addns -ads -ceph -client -cluster -cups -debug (-dmapi) (-fam) -glusterfs -gpg -iprint -json -ldap -ntvfs -pam -profiling-data -python -quota (-selinux) -snapper -spotlight -syslog (-system-heimdal) -systemd (-test) -winbind -zeroconf`
net-libs/gnutls-3.6.15 | `cxx idn nls openssl seccomp tls-heartbeat -dane -doc -examples -guile -pkcs11 -sslv2 -sslv3 -static-libs -test (-test-full) -tools -valgrind`
net-libs/libnsl-1.3.0-r1 | ``
net-libs/libtirpc-1.3.1 | `(split-usr) -ipv6 -kerberos -static-libs`
net-nds/openldap-2.4.57 | `crypt ssl syslog -berkdb -cxx -debug -experimental -gnutls -iodbc -ipv6 -kerberos -kinit (-libressl) -minimal -odbc -overlays -pbkdf2 -perl -samba -sasl (-selinux) -sha2 -smbkrb5passwd -static-libs -tcpd -test`
perl-core/File-Temp-0.230.900 | ``
sys-apps/keyutils-1.6.1 | `(split-usr) -static -static-libs -test`
sys-apps/systemd-tmpfiles-246 | `(-selinux) -test`
sys-apps/util-linux-2.36.2 | `cramfs logger nls readline (split-usr) suid (unicode) -audit -build -caps -cryptsetup -fdformat -hardlink -kill -magic -ncurses -pam -python (-selinux) -slang -static-libs -su -systemd -test -tty-helpers -udev`
sys-kernel/linux-headers-5.10 | `-headers-only`
sys-libs/e2fsprogs-libs-1.45.7 | `(split-usr) -static-libs`
sys-libs/ldb-2.1.4-r1 | `ldap lmdb -doc -python -test`
sys-libs/libcap-2.43 | `(split-usr) -pam -static-libs`
sys-libs/libcap-ng-0.7.11 | `-python -static-libs`
sys-libs/liburing-0.7-r1 | `-static-libs`
sys-libs/talloc-2.3.1 | `python -compat`
sys-libs/tdb-1.4.3 | `-python`
sys-libs/tevent-0.10.2 | `-python`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/bash** |
app-admin/eselect-1.4.17 | `-doc -emacs -vim-syntax`
app-portage/portage-utils-0.90 | `nls openmp (-libressl) -qmanifest -qtegrity -static`
app-shells/bash-5.0_p18 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins`
net-libs/nghttp2-1.41.0 | `threads -cxx -debug -hpack-tools -jemalloc (-libressl) -static-libs -test -utils -xml`
net-misc/curl-7.74.0-r2 | `ftp http2 imap openssl pop3 progress-meter smtp ssl tftp threads -adns -alt-svc -brotli -gnutls -gopher -hsts -idn -ipv6 -kerberos -ldap (-libressl) -mbedtls -metalink (-nghttp3) -nss (-quiche) -rtmp -samba -ssh -static-libs -telnet -test (-winssl) -zstd`
sys-apps/acl-2.2.53-r1 | `nls (split-usr) -static-libs`
sys-apps/attr-2.4.48-r4 | `nls (split-usr) -debug -static-libs`
sys-apps/coreutils-8.32-r1 | `acl nls (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla`
sys-apps/file-5.39-r4 | `bzip2 seccomp zlib -lzma -python -static-libs`
sys-apps/sed-4.8 | `acl nls (-selinux) -static`
sys-libs/libseccomp-2.4.4 | `-static-libs`
sys-libs/readline-8.0_p4 | `(split-usr) (unicode) -static-libs -utils`
**FROM haven/openssl** |
app-misc/ca-certificates-20210119.3.64 | `-cacert`
app-misc/c_rehash-1.7-r1 | ``
dev-libs/openssl-1.1.1k | `asm zlib -bindist -rfc3779 -sctp -sslv3 -static-libs -test -tls-heartbeat -vanilla`
sys-apps/debianutils-4.11.2 | `installkernel -static`
sys-kernel/installkernel-gentoo-2 | ``
**FROM haven/s6** |
app-admin/entr-4.6 | `-test`
dev-lang/execline-2.6.1.1 | `-static -static-libs`
dev-libs/skalibs-2.9.3.0 | `-doc -ipv6 -static-libs`
sys-apps/s6-2.9.2.0 | `execline -static -static-libs`
**FROM haven/glibc** |
app-arch/bzip2-1.0.8-r1 | `(split-usr) -static -static-libs`
app-arch/gzip-1.10 | `-pic -static`
dev-libs/gmp-6.2.1-r1 | `asm cxx -doc -pic -static-libs`
dev-libs/libpcre-8.44 | `bzip2 cxx readline recursion-limit (split-usr) (unicode) zlib -jit -libedit -pcre16 -pcre32 -static-libs`
dev-libs/libunistring-0.9.10-r1 | `-doc -static-libs`
net-dns/libidn2-2.3.0 | `-static-libs`
sys-apps/gawk-5.1.0 | `nls readline -mpfr`
sys-apps/gentoo-functions-0.13 | ``
sys-apps/grep-3.5 | `nls pcre -static`
sys-libs/glibc-2.32-r7 | `(crypt) multiarch (ssp) (static-libs) -audit -caps (-cet) -compile-locales -custom-cflags -doc -gd -headers-only (-multilib) -nscd -profile (-selinux) -static-pie -suid -systemtap -test (-vanilla)`
sys-libs/ncurses-6.2-r1 | `cxx (split-usr) threads (tinfo) (unicode) -ada -debug -doc -gpm -minimal -profile -static-libs -test -trace`
sys-libs/readline-8.0_p4 | `(split-usr) (unicode) -static-libs -utils`
sys-libs/timezone-data-2021a | `nls -leaps-timezone -zic-slim`
sys-libs/zlib-1.2.11-r3 | `(split-usr) -minizip -static-libs`
**FROM haven/busybox** |
sys-apps/busybox-1.32.1 | `make-symlinks static -debug -ipv6 -livecd -math -mdev -pam -savedconfig (-selinux) -sep-usr -syslog -systemd`
sys-apps/sed-4.8 | `static -acl -nls (-selinux)`
#### Purged
- [x] Headers
- [x] Static Libs
