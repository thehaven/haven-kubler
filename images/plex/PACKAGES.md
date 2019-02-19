### haven/plex:20190217

Built: Tue 19 Feb 19:01:08 GMT 2019
Image Size: 446MB

#### Installed
Package | USE Flags
--------|----------
app-admin/eselect-1.4.13 | `-doc -emacs -vim-syntax`
app-arch/bzip2-1.0.6-r10 | `-static -static-libs`
app-arch/xz-utils-5.2.3 | `extra-filters nls threads -static-libs`
app-eselect/eselect-python-20171204 | ``
app-misc/ca-certificates-20180409.3.37 | `-cacert`
app-misc/c_rehash-1.7-r1 | ``
app-misc/mime-types-9 | ``
app-shells/bash-4.4_p23-r1 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins`
dev-lang/python-2.7.15 | `hardened readline ssl (threads) (wide-unicode) xml (-berkdb) -bluetooth -build -doc -examples -gdbm -ipv6 -libressl -ncurses -sqlite -tk -wininst`
dev-lang/python-3.6.5 | `hardened readline ssl (threads) xml -build -examples -gdbm -ipv6 -libressl -ncurses -sqlite -test -tk -wininst`
dev-lang/python-exec-2.4.6 | ` `
dev-libs/expat-2.2.6 | `unicode -examples -static-libs`
dev-libs/glib-2.56.4 | `mime xattr -dbus -debug (-fam) (-selinux) -static-libs -systemtap -test -utils`
dev-libs/gobject-introspection-1.56.1 | `-cairo -doctool -test`
dev-libs/gobject-introspection-common-1.56.1 | ``
dev-libs/libdaemon-0.14-r3 | `-doc -examples -static-libs`
dev-libs/libffi-3.2.1 | `-debug -pax`
dev-libs/libpcre-8.41-r1 | `bzip2 cxx readline recursion-limit (unicode) zlib -jit -libedit -pcre16 -pcre32 -static-libs`
dev-libs/libxml2-2.9.9 | `readline -debug -examples -icu -ipv6 -lzma -python -static-libs -test`
dev-libs/openssl-1.0.2q | `asm sslv3 tls-heartbeat zlib -bindist -gmp -kerberos -rfc3779 -sctp -sslv2 -static-libs -test -vanilla`
dev-util/glib-utils-2.56.4 | ` `
dev-util/pkgconf-1.5.4 | `pkg-config -test`
media-tv/plex-media-server-1.15.0 | ` `
net-dns/avahi-0.7-r1 | `dbus introspection nls -autoipd -bookmarks -doc -gdbm -gtk -gtk3 -howl-compat -ipv6 -mdnsresponder-compat -mono -python -qt5 (-selinux) -test`
sys-apps/acl-2.2.52-r1 | `nls -static-libs`
sys-apps/attr-2.4.47-r2 | `nls -static-libs`
sys-apps/coreutils-8.30 | `acl nls split-usr (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla`
sys-apps/dbus-1.10.24 | `-`
sys-apps/debianutils-4.8.3 | `-static`
sys-apps/file-5.34 | `zlib -python -static-libs`
sys-apps/sed-4.5 | `acl nls -forced-sandbox (-selinux) -static`
sys-apps/util-linux-2.33-r1 | `cramfs nls readline suid unicode -build -caps -fdformat -kill -ncurses -pam -python (-selinux) -slang -static-libs -systemd -test -tty-helpers -udev`
sys-libs/libcap-2.25 | `-pam -static-libs`
sys-libs/ncurses-6.1-r2 | `cxx threads unicode -ada -debug -doc -gpm -minimal -profile -static-libs -test -tinfo -trace`
sys-libs/readline-7.0_p5 | `-static-libs -utils`
sys-libs/zlib-1.2.11-r2 | `-minizip -static-libs`
x11-misc/shared-mime-info-1.10 | `-test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/glibc** |
sys-apps/gentoo-functions-0.12 | ``
sys-libs/glibc-2.27-r6 | `hardened multiarch -audit -caps (-compile-locales) -doc -gd -headers-only (-multilib) -nscd -profile (-selinux) -suid -systemtap (-vanilla)`
sys-libs/timezone-data-2018i | `nls -leaps`
**FROM haven/busybox** |
sys-apps/busybox-1.29.3 | `make-symlinks static -debug -ipv6 -livecd -math -mdev -pam -savedconfig (-selinux) -sep-usr -syslog -systemd`
#### Purged
- [x] Headers
- [x] Static Libs
