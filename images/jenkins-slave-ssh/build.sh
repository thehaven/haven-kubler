_packages="net-misc/openssh net-misc/mosh app-admin/sudo net-misc/keychain"
export JNLP_REMOTING='4.3'
export JNLP_SLAVE_VERSION='4.3-4'

configure_builder()
{
    unmask_package 'dev-libs/openssl'
    update_keywords 'dev-libs/openssl' '+**'
    update_keywords 'net-misc/openssh' '+~amd64'
    update_use 'dev-libs/openssl' '-bindist'
    update_use 'net-misc/openssh' '-bindist'
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    /usr/sbin/groupadd -g 1000 jenkins || exit
    /usr/sbin/useradd -u 1000 -g 1000 -m jenkins || exit
    /usr/bin/curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JNLP_REMOTING}/remoting-${JNLP_REMOTING}.jar || exit
    /bin/chmod 755 /usr/share/jenkins || exit
    /bin/chmod 644 /usr/share/jenkins/slave.jar || exit
    /usr/bin/curl --create-dirs -sSLo /usr/local/bin/jenkins-slave https://raw.githubusercontent.com/jenkinsci/docker-inbound-agent/${JNLP_SLAVE_VERSION}/jenkins-agent || exit
    /bin/chmod a+x /usr/local/bin/jenkins-slave || exit
    /bin/mkdir -p /etc/sudoers.d || exit
    /bin/echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins || exit
    /bin/mkdir -p /home/jenkins/.ssh && chmod 700 /home/jenkins/.ssh || exit
    /bin/mkdir -p /home/jenkins/.jenkins || exit
    /bin/chown jenkins:jenkins /home/jenkins/ || exit
    /bin/mkdir /workdir; chown jenkins:jenkins /workdir || exit
    :
}
