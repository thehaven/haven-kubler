### haven/haproxy:dev

Built: Wed 23 Jul 16:40:40 BST 2025
Image Size: 39.9MB

#### Installed
Package | USE Flags
--------|----------
acct-group/haproxy-0-r3 | ``
acct-user/haproxy-0-r3 | ``
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
dev-libs/libpcre2-10.45 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
net-proxy/haproxy-3.2.3 | `crypt net`
sys-libs/ncurses-6.5_p20250329 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.2_p13-r1 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
#### Inherited
Package | USE Flags
--------|----------
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
