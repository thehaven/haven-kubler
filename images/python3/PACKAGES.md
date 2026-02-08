### haven/python3:dev

Built: Sun  8 Feb 11:54:01 GMT 2026
Image Size: 239MB

#### Installed
Package | USE Flags
--------|----------
app-crypt/libb2-0.98.1-r3 | `openmp -native-cflags -static-libs`
app-misc/mime-types-2.1.54 | `-nginx`
dev-db/sqlite-3.51.2 | `readline -debug -doc -icu -secure-delete -static-libs -tcl -test -tools`
dev-lang/python-3.13.12 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo -test -tk -valgrind -verify-sig`
dev-lang/python-3.14.3 | `ensurepip readline sqlite ssl -bluetooth -debug -examples -gdbm (-jit) -libedit -ncurses -pgo (-tail-call-interp) -test -tk -valgrind -verify-sig`
dev-lang/python-exec-2.4.10 | `(native-symlinks) -test`
dev-lang/python-exec-conf-2.4.6 | ` `
dev-libs/expat-2.7.4 | `unicode -examples -static-libs -test`
dev-libs/libffi-3.5.2 | `exec-static-trampoline -debug -pax-kernel -static-libs -test`
dev-libs/libpcre2-10.47 | `bzip2 jit pcre16 pcre32 readline unicode zlib -libedit -static-libs -valgrind -verify-sig`
dev-libs/mpdecimal-4.0.1 | `-cxx -test`
dev-python/cachecontrol-0.14.3 | `-test`
dev-python/certifi-3024.7.22 | `-test`
dev-python/charset-normalizer-3.4.4-r1 | `native-extensions -debug -test -verify-provenance`
dev-python/colorama-0.4.6 | `-examples -test`
dev-python/dependency-groups-1.3.1 | `-test`
dev-python/distlib-0.4.0 | `-test`
dev-python/distro-1.9.0 | `-test`
dev-python/ensurepip-pip-26.0.1 | `(test-rust) -test`
dev-python/gentoo-common-1 | ``
dev-python/idna-3.11 | ` `
dev-python/jaraco-context-6.1.0 | `-test`
dev-python/jaraco-functools-4.4.0 | `-test`
dev-python/jaraco-text-4.0.0 | `-test`
dev-python/linkify-it-py-2.0.3 | `-test`
dev-python/markdown-it-py-4.0.0 | `-test`
dev-python/mdurl-0.1.2 | `-test`
dev-python/more-itertools-10.8.0 | `-doc`
dev-python/msgpack-1.1.2 | `native-extensions -debug -test`
dev-python/packaging-26.0 | `-test -verify-provenance`
dev-python/pip-26.0.1 | `(test-rust) -test`
dev-python/platformdirs-4.5.1 | `-test -verify-provenance`
dev-python/pygments-2.19.2 | `-test`
dev-python/pyproject-hooks-1.2.0 | `-test`
dev-python/pysocks-1.7.1-r2 | ` `
dev-python/requests-2.32.5 | `(test-rust) -socks5 -test`
dev-python/resolvelib-1.2.1 | `-test`
dev-python/rich-14.3.2 | `-test`
dev-python/setuptools-81.0.0 | `-test`
dev-python/setuptools-scm-9.2.2 | `-test -verify-provenance`
dev-python/tomli-w-1.2.0 | `-test`
dev-python/trove-classifiers-2026.1.14.14 | `-test -verify-provenance`
dev-python/truststore-0.10.4 | `-test`
dev-python/typing-extensions-4.15.0 | `-test`
dev-python/uc-micro-py-1.0.3 | `-test`
dev-python/urllib3-2.6.3 | `-brotli -http2 -test -verify-provenance -zstd`
dev-python/wheel-0.46.3 | `-test -verify-provenance`
sys-apps/util-linux-2.41.3 | `caps cramfs hardlink nls readline suid tty-helpers (unicode) -audit -build -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -udev -uuidd -verify-sig`
sys-libs/libcap-ng-0.8.5 | `-python -static-libs`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/bash** |
app-admin/eselect-1.4.31 | `-doc -emacs -vim-syntax`
app-alternatives/bzip2-1 | `reference -lbzip2 -pbzip2 (-split-usr)`
app-arch/bzip2-1.0.8-r5 | `-static -static-libs -verify-sig`
app-arch/xz-utils-5.8.2 | `extra-filters nls -doc -pgo -static-libs -verify-sig`
app-arch/zstd-1.5.7-r1 | `lzma zlib -lz4 -static-libs -test -verify-sig`
app-portage/portage-utils-0.97.1 | `-openmp -qmanifest -static`
app-shells/bash-5.3_p9 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -pgo -plugins -verify-sig`
net-dns/c-ares-1.34.6 | `-static-libs -test -verify-sig`
net-libs/libpsl-0.21.5 | `idn -icu -static-libs -test`
net-libs/nghttp2-1.68.0 | `-debug -hpack-tools -jemalloc -systemd -test -utils -verify-sig -xml`
net-libs/nghttp3-1.15.0 | `-verify-sig`
net-misc/curl-8.18.0 | `adns alt-svc ftp hsts http2 http3 httpsrr imap openssl pop3 psl quic smtp ssl tftp websockets -brotli -debug -ech -gnutls -gopher -idn -kerberos -ldap -mbedtls -rtmp -rustls -samba -sasl-scram -ssh -static-libs -telnet -test -verify-sig -zstd`
sys-apps/acl-2.3.2-r2 | `nls -static-libs`
sys-apps/attr-2.5.2-r1 | `nls -debug -static-libs`
sys-apps/coreutils-9.10 | `acl nls openssl xattr -caps -gmp -hostname -kill -multicall (-selinux) (-split-usr) -static -test -test-full -vanilla -verify-sig`
sys-apps/file-5.46-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9-r1 | `acl nls (-selinux) -static -test-full -verify-sig`
sys-libs/libseccomp-2.6.0-r3 | `-debug -python -static-libs -test -verify-sig`
sys-libs/ncurses-6.5_p20251220 | `cxx minimal (tinfo) -ada -debug -doc -gpm -profile (-split-usr) (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.3_p3 | `(unicode) -static-libs -utils -verify-sig`
sys-libs/zlib-1.3.1-r1 | `-minizip -static-libs -verify-sig`
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
