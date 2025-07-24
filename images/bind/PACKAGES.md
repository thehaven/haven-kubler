### haven/bind:dev

Built: Thu 24 Jul 10:29:48 BST 2025
Image Size: 453MB

#### Installed
Package | USE Flags
--------|----------
acct-group/audio-0-r3 | ``
acct-group/cdrom-0-r3 | ``
acct-group/dialout-0-r3 | ``
acct-group/disk-0-r3 | ``
acct-group/floppy-0-r1 | ``
acct-group/input-0-r3 | ``
acct-group/kmem-0-r3 | ``
acct-group/kvm-0-r3 | ``
acct-group/lp-0-r3 | ``
acct-group/named-0-r3 | ``
acct-group/render-0-r3 | ``
acct-group/sgx-0-r2 | ``
acct-group/tape-0-r3 | ``
acct-group/tty-0-r3 | ``
acct-group/usb-0-r3 | ``
acct-group/video-0-r3 | ``
acct-user/named-0-r3 | ``
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-crypt/mit-krb5-1.21.3 | `keyutils nls pkinit -doc -lmdb -openldap (-selinux) -test -xinetd`
app-misc/mime-types-2.1.54 | `-nginx`
dev-db/sqlite-3.50.2 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/python-3.13.5 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.1 | `unicode -examples -static-libs -test`
dev-libs/gmp-6.3.0-r1 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/json-c-0.18 | `threads -doc -static-libs -test`
dev-libs/libev-4.33 | `-static-libs`
dev-libs/libffi-3.5.1 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libmaxminddb-1.11.0 | `-test`
dev-libs/libpcre2-10.45 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/libuv-1.51.0 | `-verify-sig`
dev-libs/libverto-0.3.2 | `libev threads -glib -libevent`
dev-libs/libxml2-2.13.8 | `python readline -examples -icu -lzma -static-libs -test`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-libs/mpfr-4.2.2 | `-static-libs -verify-sig`
dev-libs/userspace-rcu-0.15.3 | `-static-libs -test`
dev-python/ensurepip-pip-25.1.1 | ``
dev-python/gentoo-common-1 | ``
net-dns/bind-9.20.10 | `geoip gssapi -dnstap -doc -doh -fixed-rrset -idn (-jemalloc) -lmdb (-selinux) -static-libs -systemtap -test -xml`
sys-apps/findutils-4.10.0 | `nls (-selinux) -static -test -verify-sig`
sys-apps/gentoo-functions-0.19 | ``
sys-apps/keyutils-1.6.3-r1 | `-static -static-libs -test`
sys-apps/kmod-33 | `lzma (tools) zlib zstd -debug -doc -pkcs7 -static-libs`
sys-apps/systemd-utils-255.18 | `acl kmod tmpfiles udev -boot -kernel-install -secureboot (-selinux) (-split-usr) -sysusers -test -ukify`
sys-apps/util-linux-2.41.1 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-devel/gcc-14.3.0 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran nls openmp (pie) sanitize ssp zstd -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite -hardened (-ieee-long-double) -jit (-libssp) -lto -modula2 (-multilib) -objc -objc`
sys-devel/gcc-config-2.12.1 | `(cc-wrappers) (native-symlinks)`
sys-devel/gettext-0.22.5-r2 | `acl cxx nls openmp (xattr) -doc -emacs -git -java -ncurses -static-libs -verify-sig`
sys-fs/e2fsprogs-1.47.2-r10 | `nls tools -archive -cron -fuse -static-libs -test`
sys-fs/udev-init-scripts-35 | ``
sys-libs/libcap-2.76 | `-pam -static-libs -tools`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
sys-process/procps-4.0.5-r2 | `kill nls (unicode) -elogind -modern-top -ncurses (-selinux) -skill -static-libs -systemd -test`
sys-process/psmisc-23.7 | `nls -`
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
app-shells/bash-5.2_p37-r3 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.34.5 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.65.0-r2 | `-debug -hpack-tools -jemalloc -systemd -test -utils -xml`
net-libs/nghttp3-1.9.0 | ``
net-misc/curl-8.14.1 | `adns alt-svc ftp hsts http2 http3 httpsrr imap openssl pop3 psl quic smtp ssl tftp websockets -brotli -debug (-ech) -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp (-rustls) -samba -sasl-scram -ssh -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.5 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -vanilla -verify-sig`
sys-apps/file-5.46-r2 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -verify-sig`
sys-kernel/linux-headers-6.12 | `-headers-only`
sys-libs/libseccomp-2.6.0-r2 | `-debug -python -static-libs -test`
sys-libs/ncurses-6.5_p20250329 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.2_p13-r1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.4.1 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.7 | `-test`
dev-lang/execline-2.9.7.0 | ``
dev-libs/skalibs-2.14.4.0 | ``
sys-apps/s6-2.13.2.0 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.41-r4 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
