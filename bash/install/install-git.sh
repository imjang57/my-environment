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
case ${DIST_TYPE} in
    amazon*|centos*|redhat)
        yum erase -y git
        # https://www.endpointdev.com/blog/2021/12/installing-git-2-on-centos-7/
        yum install -y https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
        yum --enablerepo=endpoint install -y git
        ;;
    ubuntu|debian)
        apt-get -y install git
        ;;
    darwin)
        brew install git
        ;;
esac
