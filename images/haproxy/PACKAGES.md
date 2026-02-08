### haven/haproxy:dev

Built: Sun  8 Feb 14:31:50 GMT 2026
Image Size: 477MB

#### Installed
Package | USE Flags
--------|----------
acct-group/haproxy-0-r3 | ``
acct-user/haproxy-0-r3 | ``
app-admin/eselect-1.4.31 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-alternatives/sh-0 | `bash -busybox -dash -ksh -lksh -mksh`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/xz-utils-5.8.2 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.7-r1 | `lzma zlib -lz4 -static-libs -test -verify-sig`
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-eselect/eselect-lua-4-r1 | ``
app-misc/mime-types-2.1.54 | `-nginx`
app-shells/bash-5.3_p9 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
dev-db/sqlite-3.51.2 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/lua-5.4.8 | `deprecated readline`
dev-lang/python-3.13.12 | `ensurepip ncurses readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.4 | `unicode -examples -static-libs -test`
dev-libs/gmp-6.3.0-r1 | `asm cpudetection cxx -doc -pic -static-libs -verify-sig`
dev-libs/libffi-3.5.2 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.47 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/mpc-1.3.1 | `-static-libs -verify-sig`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-libs/mpfr-4.2.2 | `-static-libs -verify-sig`
dev-python/ensurepip-pip-26.0.1 | `(test-rust) -test`
dev-python/gentoo-common-1 | ``
net-proxy/haproxy-3.3.1 | `crypt lua net`
net-proxy/haproxy-dataplaneapi-3.1.5 | ``
net-proxy/hatop-0.8.2-r1 | ` `
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.10 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -test-full -vanilla -verify-sig`
sys-apps/file-5.46-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/gentoo-functions-1.7.6 | `-test`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -test-full -verify-sig`
sys-apps/util-linux-2.41.3 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-devel/gcc-15.2.1_p20251122 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran nls openmp (pie) sanitize ssp zstd -ada -cobol (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite -hardened (-ieee-long-double) -jit -libgdiagnostics (-libssp) -lto -modula2 (-multilib) -objc -objc`
sys-devel/gcc-config-2.12.2 | `(cc-wrappers) (native-symlinks)`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
sys-libs/libseccomp-2.6.0-r3 | `-debug -python -static-libs -test -verify-sig`
sys-libs/ncurses-6.5_p20251220 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.3_p3 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/openssl** |
app-misc/ca-certificates-20240203.3.98 | `-cacert`
dev-libs/openssl-3.5.5 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
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
