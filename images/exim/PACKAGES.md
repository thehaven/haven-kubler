### haven/exim:dev

Built: Mon  6 Feb 17:20:47 GMT 2023
Image Size: 485MB

#### Installed
Package | USE Flags
--------|----------
acct-group/audio-0-r1 | ``
acct-group/cdrom-0-r1 | ``
acct-group/dialout-0-r1 | ``
acct-group/disk-0-r1 | ``
acct-group/input-0-r1 | ``
acct-group/kmem-0-r1 | ``
acct-group/kvm-0-r1 | ``
acct-group/lp-0-r1 | ``
acct-group/mail-0-r1 | ``
acct-group/render-0-r1 | ``
acct-group/sgx-0 | ``
acct-group/tape-0-r1 | ``
acct-group/tty-0-r1 | ``
acct-group/video-0-r1 | ``
acct-user/mail-0-r1 | ``
acct-user/postmaster-0-r1 | ``
app-admin/metalog-20220214 | `(unicode)`
app-admin/perl-cleaner-2.30-r1 | `-pkgcore`
app-arch/lz4-1.9.4 | `-static-libs`
app-arch/xz-utils-5.4.1 | `extra-filters nls (split-usr) -static-libs -verify-sig`
app-arch/zstd-1.5.2-r3 | `(split-usr) -lz4 -static-libs`
dev-db/lmdb-0.9.29 | `-static-libs`
dev-db/mysql-connector-c-8.0.31 | `-ldap -static-libs`
dev-lang/perl-5.36.0-r1 | `-berkdb -debug -doc -gdbm -ithreads -minimal -quadmath`
dev-libs/cyrus-sasl-2.1.28-r4 | `ssl -authdaemond -berkdb -gdbm -kerberos -ldapdb -mysql -openldap -pam -postgres -sample (-selinux) -sqlite -srp -static-libs -urandom`
dev-libs/libltdl-2.4.7 | `-static-libs`
dev-libs/libpcre-8.45-r1 | `bzip2 cxx readline (split-usr) (unicode) zlib -jit -libedit -pcre16 -pcre32 -static-libs`
mail-filter/libspf2-1.2.11 | ``
mail-mta/exim-4.94.2-r7 | `dane dkim dnsdb dovecot-sasl dsn exiscan-acl ldap maildir mysql perl prdr sasl spf srs-alt ssl tpda -`
net-libs/libnsl-2.0.0-r1 | `-static-libs`
net-libs/libtirpc-1.3.3 | `(split-usr) -kerberos -static-libs`
net-mail/mailbase-1.8.1 | `-pam`
net-nds/openldap-2.6.3-r6 | `cleartext crypt ssl syslog -argon2 -autoca -cxx -debug -experimental -gnutls -iodbc -ipv6 -kerberos -kinit -minimal -odbc -overlays -pbkdf2 -perl -samba -sasl (-selinux) -sha2 -smbkrb5passwd -static-libs -systemd -tcpd -test`
perl-core/File-Temp-0.231.100 | ``
sys-apps/kmod-30 | `lzma (tools) zlib zstd -debug -doc -pkcs7 -python -static-libs`
sys-apps/systemd-utils-251.10-r1 | `acl kmod (split-usr) tmpfiles udev -boot (-selinux) -sysusers -test`
sys-apps/util-linux-2.38.1 | `cramfs hardlink nls readline (split-usr) suid (unicode) -audit -build -caps -cryptsetup -fdformat -kill -logger -magic -ncurses -pam -python (-rtas) (-selinux) -slang -static-libs -su -systemd -test -tty-helpers -udev -verify-sig`
sys-fs/e2fsprogs-1.46.5-r4 | `nls (split-usr) tools -cron -fuse -static-libs -test`
sys-fs/udev-init-scripts-35 | ``
sys-libs/db-5.3.28-r8 | `-cxx -doc -examples -tcl -test`
sys-libs/libcap-2.66 | `(split-usr) -pam -static-libs -tools`
sys-libs/libxcrypt-4.4.28-r2 | `(compat) (split-usr) (system) -headers-only -static-libs -test`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/gcc** |
dev-libs/gmp-6.2.1-r5 | `asm cpudetection cxx -doc -pic -static-libs`
dev-libs/mpc-1.3.1 | `-static-libs`
dev-libs/mpfr-4.2.0 | `-static-libs -verify-sig`
sys-devel/binutils-2.39-r4 | `cet nls plugins (-default-gold) -doc -gold (-gprofng) -multitarget -pgo -static-libs -test -vanilla`
sys-devel/binutils-config-5.4.1 | `(native-symlinks)`
sys-devel/gcc-12.2.1_p20230121-r1 | `cet (cxx) (default-stack-clash-protection) (default-znow) fortran hardened nls nptl openmp (pie) sanitize (ssp) -ada (-custom-cflags) -d -debug -doc (-fixed-point) -go -graphite (-ieee-long-double) -jit (-libssp) -lto (-multilib) -objc -objc`
sys-devel/gcc-config-2.8 | `(cc-wrappers) (native-symlinks)`
sys-devel/make-4.3 | `nls -guile -static -verify-sig`
sys-kernel/linux-headers-5.15-r3 | `-headers-only`
**FROM haven/bash** |
app-admin/eselect-1.4.20 | `-doc -emacs -vim-syntax`
app-portage/portage-utils-0.94.3 | `openmp -qmanifest -qtegrity -static`
app-shells/bash-5.1_p16-r2 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins -verify-sig`
net-dns/c-ares-1.18.1 | `-static-libs -test`
net-libs/nghttp2-1.51.0 | `-cxx -debug -hpack-tools -jemalloc -static-libs -test -utils -xml`
net-misc/curl-7.87.0-r2 | `adns ftp http2 imap openssl pop3 progress-meter smtp ssl tftp -alt-svc -brotli -gnutls -gopher -hsts -idn -ipv6 -kerberos -ldap -mbedtls (-nghttp3) -nss (-quiche) -rtmp (-rustls) -samba -ssh -sslv3 -static-libs -telnet -test -verify-sig -websockets -zstd`
sys-apps/acl-2.3.1-r1 | `nls (split-usr) -static-libs`
sys-apps/attr-2.5.1-r2 | `nls (split-usr) -debug -static-libs`
sys-apps/coreutils-9.1-r2 | `acl nls openssl (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla -verify-sig`
sys-apps/file-5.44-r3 | `bzip2 seccomp zlib -lzip -lzma -python -static-libs -verify-sig -zstd`
sys-apps/sed-4.9 | `acl nls (-selinux) -static -verify-sig`
sys-kernel/linux-headers-5.15-r3 | `-headers-only`
sys-libs/libseccomp-2.5.4 | `(-experimental-loong) -python -static-libs -test`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
**FROM haven/openssl** |
app-misc/ca-certificates-20211016.3.86 | `-cacert`
app-misc/c_rehash-1.7-r1 | ``
dev-libs/openssl-1.1.1s | `asm -rfc3779 -sctp -sslv3 -static-libs -test -tls-compression -tls-heartbeat -vanilla -verify-sig -weak-ssl-ciphers`
sys-apps/debianutils-5.7 | `installkernel -static`
sys-kernel/installkernel-gentoo-5 | `-grub`
**FROM haven/s6** |
app-admin/entr-5.2 | ``
dev-lang/execline-2.9.0.1 | ``
dev-libs/skalibs-2.12.0.1 | `-doc -ipv6`
sys-apps/s6-2.11.1.2-r1 | `execline`
**FROM haven/glibc** |
app-alternatives/awk-4 | `gawk (split-usr) -busybox -mawk -nawk`
app-alternatives/bzip2-1 | `reference (split-usr) -lbzip2 -pbzip2`
app-alternatives/gzip-0 | `reference (split-usr) -pigz`
app-arch/bzip2-1.0.8-r4 | `(split-usr) -static -static-libs -verify-sig`
app-arch/gzip-1.12-r4 | `-pic -static -verify-sig`
dev-libs/libpcre2-10.42 | `bzip2 pcre16 readline (split-usr) unicode zlib -jit -libedit -pcre32 -static-libs -verify-sig`
dev-libs/libunistring-0.9.10-r1 | `-doc -static-libs`
net-dns/libidn2-2.3.4 | `nls -static-libs -verify-sig`
sys-apps/gawk-5.2.1 | `nls readline -mpfr -pma -verify-sig`
sys-apps/gentoo-functions-0.17 | ``
sys-apps/grep-3.8-r1 | `egrep-fgrep nls pcre -static -verify-sig`
sys-libs/glibc-2.36-r5 | `cet multiarch (ssp) (static-libs) -audit -caps -compile-locales (-crypt) (-custom-cflags) -doc -gd -hash-sysv-compat -headers-only (-multilib) -multilib-bootstrap -nscd -profile (-selinux) (-stack-realign) -suid -systemd -systemtap -test (-vanilla)`
sys-libs/ncurses-6.3_p20221203-r2 | `cxx minimal (split-usr) (tinfo) -ada -debug -doc -gpm -profile (-stack-realign) -static-libs -test -trace -verify-sig`
sys-libs/readline-8.1_p2-r1 | `(split-usr) (unicode) -static-libs -utils -verify-sig`
sys-libs/timezone-data-2022g | `nls -leaps-timezone -zic-slim`
sys-libs/zlib-1.2.13-r1 | `(split-usr) -minizip -static-libs -verify-sig`
**FROM haven/busybox** |
#### Purged
- [x] Headers
- [x] Static Libs

#### Included
- [x] Headers from haven/glibc
- [x] Static Libs from haven/glibc
