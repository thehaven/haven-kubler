### haven/openssl:dev

Built: Sun  8 Feb 11:07:31 GMT 2026
Image Size: 28.4MB

#### Installed
Package | USE Flags
--------|----------
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.5.5 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
#### Inherited
Package | USE Flags
--------|----------
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
