### haven/glibc:dev

Built: Wed 23 Jul 16:15:18 BST 2025
Image Size: 17.3MB

#### Installed
Package | USE Flags
--------|----------
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.41-r4 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/busybox** |

#### Purged
- [x] Headers
- [x] Static Libs
