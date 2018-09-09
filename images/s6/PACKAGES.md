### haven/s6:20180729

Built: Sat  8 Sep 18:49:28 BST 2018
Image Size: 11.9MB



















#### Installed
Package | USE Flags
--------|----------
app-admin/entr-4.1 | `{-test}`
dev-lang/execline-2.3.0.4 | `-static -static-libs`
dev-libs/skalibs-2.6.4.0 | `-doc -ipv6 -static-libs`
sys-apps/s6-2.7.1.1 | `-static -static-libs`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/glibc** |
sys-apps/gentoo-functions-0.12 | ``
sys-libs/glibc-2.26-r7 | `hardened -audit -caps -debug -doc -gd -headers-only (-multilib) -nscd (-profile) (-selinux) -suid -systemtap (-vanilla)`
sys-libs/timezone-data-2018d | `nls -leaps`
**FROM haven/busybox** |
sys-apps/busybox-1.29.0 | `make-symlinks static -debug -ipv6 -livecd -math -mdev -pam -savedconfig (-selinux) -sep-usr -syslog -systemd`
#### Purged
- [x] Headers
- [x] Static Libs
