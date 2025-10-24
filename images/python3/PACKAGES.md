### haven/python3:dev

Built: Thu 23 Oct 23:19:11 BST 2025
Image Size: 237MB

#### Installed
Package | USE Flags
--------|----------
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-misc/mime-types-2.1.54 | `-nginx`
dev-db/sqlite-3.50.4 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/python-3.13.9 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-3.14.0 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -tail-call-interp -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.3 | `unicode -examples -static-libs -test`
dev-libs/libffi-3.5.2 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.47 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-python/cachecontrol-0.14.3 | `-test`
dev-python/certifi-3024.7.22 | `-test`
dev-python/charset-normalizer-3.4.4 | `-test -verify-provenance`
dev-python/colorama-0.4.6 | `-examples -test`
dev-python/dependency-groups-1.3.1 | `-test`
dev-python/distlib-0.4.0 | `-test`
dev-python/distro-1.9.0 | `-test`
dev-python/ensurepip-pip-25.2 | `(test-rust) -test`
dev-python/gentoo-common-1 | ``
dev-python/idna-3.11 | ` `
dev-python/jaraco-collections-5.2.1 | `-test`
dev-python/jaraco-context-6.0.1-r1 | `-test`
dev-python/jaraco-functools-4.3.0 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/linkify-it-py-2.0.3 | `-test`
dev-python/markdown-it-py-4.0.0 | `-test`
dev-python/mdurl-0.1.2 | `-test`
dev-python/more-itertools-10.8.0 | `-doc`
dev-python/msgpack-1.1.2 | `native-extensions -debug -test`
dev-python/packaging-25.0 | `-test`
dev-python/pip-25.2 | `(test-rust) -test`
dev-python/platformdirs-4.5.0 | `-test`
dev-python/pygments-2.19.2 | `-test`
dev-python/pyproject-hooks-1.2.0 | `-test`
dev-python/pysocks-1.7.1-r2 | ` `
dev-python/requests-2.32.5 | `(test-rust) -socks5 -test`
dev-python/resolvelib-1.2.1 | `-test`
dev-python/rich-14.2.0 | `-test`
dev-python/setuptools-80.9.0-r1 | `-test`
dev-python/setuptools-scm-9.2.2 | `-test -verify-provenance`
dev-python/tomli-w-1.2.0 | `-test`
dev-python/trove-classifiers-2025.9.11.17 | `-test -verify-provenance`
dev-python/truststore-0.10.4 | `-test`
dev-python/typing-extensions-4.15.0 | `-test`
dev-python/uc-micro-py-1.0.3 | `-test`
dev-python/urllib3-2.5.0 | `-brotli -http2 -test -zstd`
dev-python/wheel-0.45.1 | `-test`
sys-apps/util-linux-2.41.2 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
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
dev-libs/openssl-3.5.4 | `asm quic -fips -ktls -rfc3779 -sctp -static-libs -test -tls-compression -vanilla -verify-sig -weak-ssl-ciphers`
**FROM haven/s6** |
app-admin/entr-5.7 | `-test`
dev-lang/execline-2.9.7.0 | ``
dev-libs/skalibs-2.14.4.0 | ``
sys-apps/s6-2.13.2.0 | `execline`
**FROM haven/glibc** |
dev-libs/libunistring-1.3 | `-doc -static-libs`
net-dns/libidn2-2.3.8 | `nls -static-libs -verify-sig`
sys-libs/glibc-2.42-r1 | `cet multiarch ssp (static-libs) -audit -caps -compile-locales (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -perl -profile (-selinux) -sframe (-stack-realign) -suid -systemd -systemtap -test (-vanilla) -verify-sig`
sys-libs/libxcrypt-4.4.38 | `(compat) (system) -headers-only -static-libs -test`
sys-libs/timezone-data-2025b | `nls -leaps-timezone -zic-slim`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs
