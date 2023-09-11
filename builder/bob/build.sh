#
# Kubler phase 1 config, pick installed packages and/or customize the build
#

#
# This hook can be used to configure the build container itself, install packages, run any command, etc
#
configure_bob() {
    fix_portage_profile_symlink
    emerge --unmerge perl; emerge app-admin/perl-cleaner && perl-cleaner --all
    emerge -u --usepkg=n dev-vcs/git sys-apps/portage app-portage/gemato app-portage/flaggie app-portage/eix app-portage/gentoolkit
    rm -Rf /var/db/repos/gentoo; emerge --sync
    # install basics used by helper functions
    eselect news read new 1> /dev/null
    mkdir -p /etc/portage/package.{accept_keywords,unmask,mask,use}
    # FUCK PERL!
    #emerge -uDNv --backtrack=100 --autounmask-keep-masks=y @world
    #emerge app-admin/perl-cleaner && perl-cleaner --all
    
    # use hot fix in 0.99.4
    echo '=app-portage/flaggie-0.99.4 ~amd64' >> /etc/portage/package.accept_keywords/flaggie
    emerge app-portage/flaggie app-portage/eix app-portage/gentoolkit
    configure_eix
    touch /etc/portage/package.accept_keywords/flaggie
    # set locale of build container
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
    locale-gen
    echo 'LANG="en_US.utf8"' > /etc/env.d/02locale
    env-update
    source /etc/profile
    # install default packages
    # when using overlay1 docker storage the created hard link will trigger an error during openssh uninstall
    [[ -f /usr/"${_LIB}"/misc/ssh-keysign ]] && rm /usr/"${_LIB}"/misc/ssh-keysign
    update_use 'dev-vcs/git' '-perl'
    update_use 'app-crypt/pinentry' '+ncurses'
    update_use 'sys-apps/util-linux' '+caps -pam -su +tty-helpers'
    update_keywords 'app-admin/su-exec' '+~amd64'
    emerge dev-vcs/git app-eselect/eselect-repository app-misc/jq app-shells/bash-completion
    #install_git_postsync_hooks
    emerge --update --newuse --deep @world
    emerge --update --changed-use --deep --with-bdeps=y --changed-deps=y --binpkg-respect-use=y --autounmask-write @world
    add_overlay haven-overlay https://gitlab-ee.thehavennet.org.uk/gentoo/haven-overlay.git
    add_overlay kubler https://github.com/edannenberg/kubler-overlay.git
    emerge dev-lang/go
    emerge @preserved-rebuild
}
