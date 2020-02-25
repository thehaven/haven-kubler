_packages="net-misc/openssh net-misc/mosh app-admin/sudo net-misc/keychain"

configure_builder()
{
    unmask_package 'dev-libs/openssl'
    update_keywords 'dev-libs/openssl' '+**'
    update_keywords 'net-misc/openssh' '+~amd64'
    update_use 'dev-libs/openssl' '-bindist'
    update_use 'net-misc/openssh' '-bindist'
    :
}

configure_rootfs_build()
{
    :
}

finish_rootfs_build()
{
    JNLP_REMOTING='3.9'
    JNLP_SLAVE_VERSION='3.36-2'

    # Add Jenkins user and Remoting jar:
    groupadd -g 1000 jenkins
    useradd -u 1000 -g 1000 -m jenkins
    curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JNLP_REMOTING}/remoting-${JNLP_REMOTING}.jar
    chmod 755 /usr/share/jenkins
    chmod 644 /usr/share/jenkins/slave.jar
    # Install Jenkins-Slave binary ( https://github.com/jenkinsci/docker-jnlp-slave ):
    curl --create-dirs -sSLo /usr/local/bin/jenkins-slave https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/${JNLP_SLAVE_VERSION}/jenkins-slave
    chmod a+x /usr/local/bin/jenkins-slave
    # Allow sudo for jenkins
    mkdir -p /etc/sudoers.d
    echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins
    mkdir -p /home/jenkins/.ssh && chmod 700 /home/jenkins/.ssh
    mkdir -p /home/jenkins/.jenkins
    chown jenkins:jenkins /home/jenkins/
    mkdir /workdir; chown jenkins:jenkins /workdir
    :
}
