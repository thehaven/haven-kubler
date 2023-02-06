#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="dev-libs/apr dev-java/tomcat-native www-servers/tomcat"
_tomcat_slot="${BOB_TOMCAT_SLOT}"

configure_bob()
{
    # needs jdk 8 for building
    emerge dev-java/openjdk-bin:8
    eselect java-vm set system 1
    # build tomcat-native package on the host
    unprovide_package dev-java/java-config app-eselect/eselect-java app-arch/zip
    emerge dev-java/ant-core dev-java/ant-junit dev-java/java-config dev-java/tomcat-native www-servers/tomcat
}

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    provide_package dev-java/java-config app-eselect/eselect-java
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    local tomcat_path catalina cata_conf tomcat_deps gentoo_classpath
    tomcat_path="${_EMERGE_ROOT}"/usr/share/"${_tomcat_slot}"
    catalina="${tomcat_path}"/bin/catalina.sh
    cata_conf="${tomcat_path}"/conf/catalina.properties

    mkdir -p "${_EMERGE_ROOT}"/etc/init.d

    # adapted from Gentoo's Tomcat init.d script
    tomcat_deps="$(java-config --query DEPEND --package "${_tomcat_slot}")"
    tomcat_deps=${tomcat_deps%:}

    gentoo_classpath="$(java-config --with-dependencies --classpath "${tomcat_deps//:/,}")"
    gentoo_classpath=${gentoo_classpath%:}

    sed-or-die "CLASSPATH=\`java-config --classpath "${_tomcat_slot}"\`" "CLASSPATH=`java-config --with-dependencies --classpath "${_tomcat_slot}",tomcat-native`" "${catalina}"
    sed-or-die "\${gentoo\.classpath}" "${gentoo_classpath//:/,}" "${cata_conf}"

    # make TOMCAT_SLOT available in build containers depending on this image
    echo -e "#!/usr/bin/env bash\nexport TOMCAT_SLOT=${_tomcat_slot}" > /etc/profile.d/tomcat.sh
    chmod +x  /etc/profile.d/tomcat.sh
}
