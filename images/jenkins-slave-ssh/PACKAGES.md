### haven/jenkins-slave-ssh:dev

Built: Tue 25 Feb 14:04:55 GMT 2020
Image Size: 309MB

#### Installed
Package | USE Flags
--------|----------
acct-group/sshd-0 | ``
acct-user/sshd-0 | ``
app-admin/metalog-20181125 | `unicode`
app-admin/perl-cleaner-2.27 | ``
app-admin/sudo-1.8.28_p1-r2 | `nls secure-path sendmail -gcrypt -ldap -libressl -offensive -pam -sasl (-selinux) -skey -sssd -system-digest`
app-editors/nano-4.6 | `magic nls spell (split-usr) unicode -debug -justify -minimal -ncurses -slang -static`
app-misc/editor-wrapper-4-r1 | ``
dev-lang/perl-5.30.1 | `-berkdb -debug -doc -gdbm -ithreads`
dev-libs/gmp-6.1.2-r1 | `asm cxx -doc -pic -static-libs`
dev-libs/libpcre-8.42 | `bzip2 cxx readline recursion-limit (split-usr) (unicode) zlib -jit -libedit -pcre16 -pcre32 -static-libs`
dev-libs/nettle-3.4.1 | `gmp -doc (-neon) -static-libs -test`
dev-libs/protobuf-3.10.1 | `zlib -emacs -examples -static-libs -test`
dev-perl/IO-Tty-1.120.0 | ``
mail-mta/nullmailer-2.2 | `ssl -test`
net-libs/gnutls-3.6.7-r1 | `cxx idn nls openssl seccomp tls-heartbeat -dane -doc -examples -guile -pkcs11 -sslv2 -sslv3 -static-libs -test (-test-full) -tools -valgrind`
net-misc/keychain-2.8.5 | ``
net-misc/mosh-1.3.2 | `client mosh-hardening server utempter -examples -libressl -ufw`
net-misc/openssh-8.2_p1-r2 | `(pie) ssl -`
perl-core/File-Temp-0.230.900 | ``
sys-apps/opentmpfiles-0.2 | `(-selinux)`
sys-apps/shadow-4.6 | `acl cracklib nls (split-usr) xattr -audit -pam (-selinux) -skey`
sys-libs/cracklib-2.9.7 | `nls (split-usr) zlib -python -static-libs`
sys-libs/libutempter-1.1.6-r2 | `-static-libs`
#### Inherited
Package | USE Flags
--------|----------
**FROM haven/jdk-oracle** |
app-arch/bzip2-1.0.6-r11 | `(split-usr) -static -static-libs`
app-crypt/p11-kit-0.23.16.1-r1 | `asn1 libffi trust -debug`
app-eselect/eselect-fontconfig-1.1-r1 | ``
app-eselect/eselect-java-0.4.0 | ``
dev-java/java-config-2.2.0-r4 | `-test`
dev-java/oracle-jdk-bin-1.8.0.202 | `fontconfig headless-awt -alsa -commercial -cups -doc -examples -javafx -jce -nsplugin (-selinux) -source -visualvm`
dev-libs/expat-2.2.8 | `(split-usr) unicode -examples -static-libs`
dev-libs/libffi-3.3-r1 | `-debug -pax`
dev-libs/libtasn1-4.13 | `-doc -static-libs -test -valgrind`
media-fonts/liberation-fonts-2.00.1-r3 | `-`
media-libs/fontconfig-2.13.0-r4 | `-doc -static-libs`
media-libs/freetype-2.9.1-r3 | `adobe-cff bindist bzip2 cleartype`
sys-apps/baselayout-java-0.1.0-r1 | ``
sys-apps/util-linux-2.33.2 | `cramfs nls readline (split-usr) suid unicode -build -caps -fdformat -kill -ncurses -pam -python (-selinux) -slang -static-libs -systemd -test -tty-helpers -udev`
**FROM haven/bash** |
app-admin/eselect-1.4.15 | `-doc -emacs -vim-syntax`
app-portage/portage-utils-0.80 | `nls openmp -libressl -qmanifest -qtegrity -static`
app-shells/bash-4.4_p23-r1 | `net nls (readline) -afs -bashlogger -examples -mem-scramble -plugins`
dev-libs/iniparser-3.1-r1 | `-doc -examples -static-libs`
net-misc/curl-7.66.0 | `progress-meter ssl threads -adns -alt-svc -brotli -http2 -idn -ipv6 -kerberos -ldap -metalink (-nghttp3) (-quiche) -rtmp -samba -ssh -static-libs -test`
sys-apps/acl-2.2.53 | `nls (split-usr) -static-libs`
sys-apps/attr-2.4.48-r3 | `nls (split-usr) -debug -static-libs`
sys-apps/coreutils-8.30 | `acl nls (split-usr) (xattr) -caps -gmp -hostname -kill -multicall (-selinux) -static -test -vanilla`
sys-apps/file-5.37-r1 | `zlib -python -static-libs`
sys-apps/sed-4.7 | `acl nls (-selinux) -static`
sys-libs/ncurses-6.1_p20190609 | `cxx minimal (split-usr) threads (tinfo) unicode -ada -debug -doc -gpm -profile -static-libs -test -trace`
sys-libs/readline-7.0_p5-r1 | `(split-usr) unicode -static-libs -utils`
**FROM haven/openssl** |
app-misc/ca-certificates-20190110.3.43 | `-cacert`
app-misc/c_rehash-1.7-r1 | ``
dev-libs/openssl-1.1.1d-r3 | `asm zlib -bindist -rfc3779 -sctp -sslv3 -static-libs -test -tls-heartbeat -vanilla`
sys-apps/debianutils-4.8.3 | `-static`
sys-libs/zlib-1.2.11-r2 | `(split-usr) -minizip -static-libs`
**FROM haven/s6** |
app-admin/entr-4.3 | `-test`
dev-lang/execline-2.5.3.0 | `-static -static-libs`
dev-libs/skalibs-2.9.1.0 | `-doc -ipv6 -static-libs`
sys-apps/s6-2.9.0.1 | `-static -static-libs`
**FROM haven/glibc** |
dev-libs/libunistring-0.9.10 | `-doc -static-libs`
net-dns/libidn2-2.1.1a-r1 | `-static-libs`
sys-apps/gentoo-functions-0.12 | ``
sys-libs/glibc-2.29-r7 | `multiarch (ssp) -audit -caps (-cet) -compile-locales -doc -gd -headers-only (-multilib) -nscd -profile (-selinux) -suid -systemtap -test (-vanilla)`
sys-libs/timezone-data-2019c | `nls -leaps-timezone`
**FROM haven/busybox** |
sys-apps/busybox-1.30.1 | `make-symlinks static -debug -ipv6 -livecd -math -mdev -pam -savedconfig (-selinux) -sep-usr -syslog -systemd`
#### Purged
- [x] Headers
- [x] Static Libs
