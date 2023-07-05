### haven/roon:dev

Built: Wed  5 Jul 20:56:28 BST 2023
Image Size: 733MB

#### Installed
Package | USE Flags
--------|----------
acct-group/audio-0-r1 | ``
acct-group/cdrom-0-r1 | ``
acct-group/dialout-0-r1 | ``
acct-group/disk-0-r1 | ``
acct-group/floppy-0 | ``
acct-group/input-0-r1 | ``
acct-group/kmem-0-r1 | ``
acct-group/kvm-0-r1 | ``
acct-group/lp-0-r1 | ``
acct-group/render-0-r1 | ``
acct-group/sgx-0 | ``
acct-group/tape-0-r1 | ``
acct-group/tty-0-r1 | ``
acct-group/usb-0-r1 | ``
acct-group/video-0-r1 | ``
app-admin/perl-cleaner-2.30-r1 | `-pkgcore`
app-arch/libarchive-3.6.2-r1 | `acl bzip2 e2fsprogs iconv lzma xattr -blake2 -expat -lz4 -lzo -nettle -static-libs -verify-sig -zstd`
app-arch/xz-utils-5.4.2 | `extra-filters nls (split-usr) -doc -static-libs -verify-sig`
app-arch/zstd-1.5.5 | `lzma (split-usr) zlib -lz4 -static-libs -test`
app-crypt/libb2-0.98.1-r2 | `openmp -native-cflags -static-libs`
app-crypt/libmd-1.0.4 | ``
app-crypt/mit-krb5-1.20.1 | `keyutils nls pkinit threads -doc -lmdb -openldap (-selinux) -test -xinetd`
app-misc/mime-types-2.1.53 | `-nginx`
dev-db/lmdb-0.9.30 | `-static-libs`
dev-db/sqlite-3.41.2-r1 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/perl-5.36.0-r2 | `-berkdb -debug -doc -gdbm -ithreads -minimal -quadmath`
dev-lang/python-3.11.3 | `ensurepip hardened readline sqlite ssl -bluetooth -build -examples -gdbm -libedit -lto -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.5.0 | `unicode -examples -static-libs`
dev-libs/icu-72.1 | `-debug -doc -examples -static-libs -test -verify-sig`
dev-libs/libbsd-0.11.7-r2 | `-static-libs -verify-sig`
dev-libs/libev-4.33 | `-static-libs`
dev-libs/libffi-3.4.4-r1 | `-debug (-exec-static-trampoline) -pax-kernel -static-libs -test`
dev-libs/libuv-1.44.2-r1 | ``
dev-libs/libverto-0.3.1-r1 | `libev threads -glib -libevent -static-libs -tevent`
dev-libs/libxml2-2.10.4 | `ftp python readline -debug -examples -icu -lzma -static-libs -test`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpfr-4.2.0 | `-static-libs -verify-sig`
dev-libs/nettle-3.8.1 | ``
dev-libs/popt-1.19 | `nls -static-libs`
dev-perl/Parse-Yapp-1.210.0-r1 | `-examples -test`
dev-python/ensurepip-pip-23.1.2 | ``
dev-python/ensurepip-setuptools-67.6.1 | ``
dev-python/ensurepip-wheels-100 | ``
dev-python/gentoo-common-1 | ``
dev-util/cmocka-1.1.5 | `-doc -examples -static-libs -test`
media-libs/alsa-lib-1.2.8-r1 | `-alisp -debug -doc -python`
media-libs/alsa-topology-conf-1.2.5.1 | ``
media-libs/alsa-ucm-conf-1.2.8 | ``
media-libs/libsamplerate-0.2.2 | `-test`
media-sound/alsa-utils-1.2.8-r2 | `libsamplerate nls -bat -doc -ieee1394 -ncurses (-selinux)`
media-video/ffmpeg-4.4.3 | ``
net-dns/bind-tools-9.16.37-r1 | `caps readline -doc -gssapi -idn -libedit -test -xml`
net-fs/cifs-utils-6.15-r1 | `acl ads caps python -creds -pam -systemd`
net-fs/samba-4.16.9 | `acl regedit system-mitkrb5 -addc -ads -ceph -client -cluster -cups -debug (-fam) -glusterfs -gpg -iprint -json -ldap -llvm-libunwind -pam -profiling-data -python -quota (-selinux) -snapper -spotlight -syslog (-system-heimdal) -systemd (-test) -unwind -winbind -zeroconf`
perl-core/File-Temp-0.231.100 | ``
sys-apps/keyutils-1.6.3 | `(split-usr) -static -static-libs -test`
sys-apps/kmod-30-r1 | `lzma (tools) zlib zstd -debug -doc -pkcs7 -python -static-libs`
sys-apps/systemd-utils-252.9 | `acl kmod (split-usr) tmpfiles udev -boot (-selinux) -sysusers -test`
sys-apps/util-linux-2.38.1-r2 | `cramfs hardlink nls readline (split-usr) suid (unicode) -audit -build -caps -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -tty-helpers -udev -verify-sig`
sys-devel/gcc-12.2.1_p20230428-r1 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran hardened nls nptl openmp (pie) sanitize (ssp) -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite (-ieee-long-double) -jit (-libssp) -lto (-multilib) -objc -objc`
sys-devel/gcc-config-2.10 | `(cc-wrappers) (native-symlinks)`
sys-devel/gettext-0.21.1 | `acl cxx nls openmp -doc -emacs -git -java -ncurses -static-libs -verify-sig`
sys-fs/e2fsprogs-1.47.0-r1 | `nls (split-usr) tools -cron -fuse -static-libs -test`
sys-fs/udev-init-scripts-35 | ``
sys-libs/ldb-2.5.2 | `lmdb -doc -ldap -python -test`
sys-libs/libcap-2.68 | `(split-usr) -pam -static-libs -tools`
sys-libs/libcap-ng-0.8.3 | `-python -static-libs`
sys-libs/liburing-2.3-r4 | `-examples -static-libs -test`
sys-libs/libxcrypt-4.4.33 | `(compat) (split-usr) (system) -headers-only -static-libs -test`
sys-libs/talloc-2.4.0 | `python -compat -valgrind`
sys-libs/tdb-1.4.8 | `-python`
sys-libs/tevent-0.14.1 | `-python -test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/bash** |
app-admin/eselect-1.4.22-r1 | `-doc -emacs -vim-syntax`
app-portage/portage-utils-0.95 | `openmp -qmanifest -qtegrity -static`
app-shells/bash-5.1_p16-r6 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins -verify-sig`
net-dns/c-ares-1.19.1 | `-static-libs -test -verify-sig`
net-libs/nghttp2-1.51.0 | `-cxx -debug -hpack-tools -jemalloc -static-libs -test -utils -xml`
net-misc/curl-8.0.1 | `adns ftp http2 imap openssl pop3 progress-meter smtp ssl tftp -alt-svc -brotli -gnutls -gopher -hsts -idn -kerberos -ldap -mbedtls (-nghttp3) -nss -rtmp (-rustls) -samba -ssh -sslv3 -static-libs -telnet -test -verify-sig -websockets -zstd`
sys-apps/acl-2.3.1-r1 | `nls (split-usr) -static-libs`
sys-apps/attr-2.5.1-r2 | `nls (split-usr) -debug -static-libs`
sys-apps/coreutils-9.3-r2 | `acl nls openssl (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla -verify-sig`
sys-apps/file-5.44-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9 | `acl nls (-selinux) -static -verify-sig`
sys-kernel/linux-headers-6.1 | `-headers-only`
sys-libs/libseccomp-2.5.4 | `(-experimental-loong) -python -static-libs -test`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20230311.3.89.1 | `-cacert`
dev-libs/openssl-1.1.1u | `asm -rfc3779 -sctp -sslv3 -static-libs -test -tls-compression -tls-heartbeat -vanilla -verify-sig -weak-ssl-ciphers`
sys-apps/debianutils-5.7 | `installkernel -static`
sys-kernel/installkernel-gentoo-7 | `-grub`
**FROM haven/s6** |
app-admin/entr-5.3-r1 | `-test`
dev-lang/execline-2.9.3.0 | ``
dev-libs/skalibs-2.13.1.1 | ``
sys-apps/s6-2.11.3.2 | `execline`
**FROM haven/glibc** |
app-alternatives/awk-4 | `gawk (split-usr) -busybox -mawk -nawk`
app-alternatives/bzip2-1 | `reference (split-usr) -lbzip2 -pbzip2`
app-alternatives/gzip-0 | `reference (split-usr) -pigz`
app-arch/bzip2-1.0.8-r4 | `(split-usr) -static -static-libs -verify-sig`
app-arch/gzip-1.12-r4 | `-pic -static -verify-sig`
dev-libs/libpcre2-10.42-r1 | `bzip2 pcre16 readline (split-usr) unicode zlib -jit -libedit -pcre32 -static-libs -valgrind -verify-sig`
dev-libs/libunistring-0.9.10-r1 | `-doc -static-libs`
net-dns/libidn2-2.3.4 | `nls -static-libs -verify-sig`
sys-apps/findutils-4.9.0-r2 | `nls (-selinux) -static -test -verify-sig`
sys-apps/gawk-5.2.2 | `nls readline -mpfr -pma -verify-sig`
sys-apps/gentoo-functions-0.19 | ``
sys-apps/grep-3.11 | `egrep-fgrep nls pcre -static -verify-sig`
sys-libs/glibc-2.36-r8 | `cet multiarch (ssp) (static-libs) -audit -caps -compile-locales (-crypt) (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/ncurses-6.4_p20230401 | `cxx minimal (split-usr) (tinfo) -ada -debug -doc -gpm -profile (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
sys-libs/timezone-data-2023c | `nls -leaps-timezone -zic-slim`
sys-libs/zlib-1.2.13-r1 | `(split-usr) -minizip -static-libs -verify-sig`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
