#!/bin/bash

################################################################################
# Init script
################################################################################
echo ">> Start installing Git."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Get system info
################################################################################
OS_TYPE=$(get_os_type)
case ${OS_TYPE} in
    linux)
        DIST_TYPE=$(get_distribution_type)
        ;;
    darwin)
        DIST_TYPE="darwin"
        ;;
    *)
        echo "Not supported DIST_TYPE"
        exit 1
        ;;
esac


################################################################################
# Set parameters
################################################################################
GIT_VERSION=2.32.0
GIT_ARCHIVE_FILE=v${GIT_VERSION}.tar.gz
GIT_ARCHIVE_URL=https://github.com/git/git/archive/${GIT_ARCHIVE_FILE}


################################################################################
# Install git
################################################################################
function install_git() {
    curl --silent -L -o git.tar.gz https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz
    tar -C ${LOCAL_TMP} -xzvf git.tar.gz
    rm git.tar.gz

    (cd ${LOCAL_TMP}/git-${GIT_VERSION} \
        && make configure \
        && ./configure --prefix ${LOCAL_OPT}/git \
        && make all doc info \
        && make install install-doc install-html install-info
        )

    ln -sf ${LOCAL_OPT}/git/bin/git ${LOCAL_BIN}/git
}
case ${DIST_TYPE} in
    amazon*|centos|redhat)
        #sudo yum install -y git
        sudo yum install -y \
            gettext-devel perl-devel expat-devel openssl-devel zlib-devel curl-devel \
            asciidoc xmlto docbook2X
        # Below is needed due to binary name differences.
        sudo ln -sf /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
        install_git
        ;;
    ubuntu|debian)
        sudo apt-get -y install git
        ;;
    darwin)
        brew install git
        ;;
esac
