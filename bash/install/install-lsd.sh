#!/bin/bash
################################################################################
# Description
# - https://github.com/lsd-rs/lsd
################################################################################


################################################################################
# Init script
################################################################################
echo ">> Start installing lsd."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Set parameters
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
# Install
################################################################################
case ${DIST_TYPE} in
    amazon*|centos*|redhat)
        ;;
    ubuntu*|debian*)
        apt install lsd
        ;;
    darwin)
        brew install lsd
        ;;
    *)
        echo "Unknown DIST_TYPE: ${DIST_TYPE}"
        ;;
esac
