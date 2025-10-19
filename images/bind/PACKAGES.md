### haven/bind:dev

Built: Sun 19 Oct 19:04:57 BST 2025
Image Size: 117MB

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
app-crypt/mit-krb5-1.22.1 | `keyutils nls pkinit -doc -lmdb -openldap (-selinux) -test -xinetd`
app-i18n/gnulib-l10n-20241231 | ``
dev-libs/json-c-0.18 | `threads -doc -static-libs -test`
dev-libs/libev-4.33 | `-static-libs`
dev-libs/libmaxminddb-1.12.2 | `-test`
dev-libs/libpcre2-10.46 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/libuv-1.51.0-r1 | `-verify-sig`
dev-libs/libverto-0.3.2 | `libev threads -glib -libevent`
dev-libs/libxml2-2.15.1 | `readline -doc -icu -python -static-libs -test`
dev-libs/userspace-rcu-0.15.3 | `-static-libs -test`
net-dns/bind-9.20.13 | `geoip gssapi -dnstap -doc -doh -fixed-rrset -idn (-jemalloc) -lmdb (-selinux) -static-libs -systemtap -test -xml`
sys-apps/keyutils-1.6.3-r1 | `-static -static-libs -test`
sys-apps/kmod-34.2 | `lzma (tools) zlib zstd -debug -doc -pkcs7`
sys-apps/systemd-utils-256.17 | `acl kmod tmpfiles udev -boot -kernel-install -secureboot (-selinux) (-split-usr) -sysusers -test -ukify`
sys-apps/util-linux-2.41.2 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-devel/gettext-0.23.2 | `acl cxx nls openmp (xattr) -doc -emacs -git -java -ncurses -static-libs -verify-sig`
sys-fs/e2fsprogs-1.47.3-r1 | `nls tools -archive -cron -fuse -static-libs -test`
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
app-shells/bash-5.3_p3-r3 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.34.5 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.67.1 | `-debug -hpack-tools -jemalloc -systemd -test -utils -xml`
net-libs/nghttp3-1.12.0 | ``
net-misc/curl-8.16.0-r1 | `adns alt-svc ftp hsts http2 http3 httpsrr imap openssl pop3 psl quic smtp ssl tftp websockets -brotli -debug -ech -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp -rustls -samba -sasl-scram -ssh -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.8-r1 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -test-full -vanilla -verify-sig`
sys-apps/file-5.46-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -test-full -verify-sig`
sys-kernel/linux-headers-6.17-r1 | `-headers-only`
sys-libs/libseccomp-2.6.0-r2 | `-debug -python -static-libs -test`
sys-libs/ncurses-6.5_p20250802 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.3_p1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.5.3 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.7 | `-test`
dev-lang/execline-2.9.7.0 | ``
dev-libs/skalibs-2.14.4.0 | ``
sys-apps/s6-2.13.2.0 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.42-r1 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) -sframe (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
