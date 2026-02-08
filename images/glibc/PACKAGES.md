### haven/glibc:dev

Built: Sun  8 Feb 11:01:30 GMT 2026
Image Size: 17.9MB

#### Installed
Package | USE Flags
--------|----------
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.43 | `cet multiarch ssp (static-libs) -audit -caps (-clang) -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) -sframe (-stack-realign) -suid -systemd -systemtap -test (-vanilla) -verify-sig`
sys-libs/libxcrypt-4.4.38-r1 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025c | `nls -leaps-timezone -zic-slim`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/busybox** |

#### Purged
- [x] Headers
- [x] Static Libs
