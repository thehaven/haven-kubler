_packages="net-misc/openssh net-misc/mosh app-admin/sudo net-misc/keychain"
export JNLP_REMOTING='4.3'
export JNLP_SLAVE_VERSION='4.3-4'

configure_builder()
{
    unmask_package 'dev-libs/openssl'
    update_keywords 'dev-libs/openssl' '+**'
    update_keywords 'net-misc/openssh' '+~amd64'
}

configure_rootfs_build()
{
    /usr/sbin/groupadd -g 1000 jenkins
    /usr/sbin/useradd -u 1000 -g 1000 -m jenkins
    /usr/bin/curl --create-dirs -sSLo "${_EMERGE_ROOT}"/usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JNLP_REMOTING}/remoting-${JNLP_REMOTING}.jar
    /bin/chmod 755 "${_EMERGE_ROOT}"/usr/share/jenkins
    /bin/chmod 644 "${_EMERGE_ROOT}"/usr/share/jenkins/slave.jar
    /usr/bin/curl --create-dirs -sSLo "${_EMERGE_ROOT}"/usr/local/bin/jenkins-agent https://raw.githubusercontent.com/jenkinsci/docker-inbound-agent/${JNLP_SLAVE_VERSION}/jenkins-agent
    /bin/chmod a+x "${_EMERGE_ROOT}"/usr/local/bin/jenkins-agent
    /bin/mkdir -p "${_EMERGE_ROOT}"/etc/sudoers.d
    /bin/echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > "${_EMERGE_ROOT}"/etc/sudoers.d/jenkins
    /bin/mkdir -p "${_EMERGE_ROOT}"/home/jenkins/.ssh && chmod 700 "${_EMERGE_ROOT}"/home/jenkins/.ssh
    /bin/mkdir -p "${_EMERGE_ROOT}"/home/jenkins/.jenkins
    /bin/chown jenkins:jenkins "${_EMERGE_ROOT}"/home/jenkins/
    /bin/mkdir "${_EMERGE_ROOT}"/workdir; chown jenkins:jenkins "${_EMERGE_ROOT}"/workdir
}

finish_rootfs_build()
{
    :
}
