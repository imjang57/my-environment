#!/bin/bash

################################################################################
# Init script
################################################################################
echo ">> Start installing Golang."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh

################################################################################
# Get system info
################################################################################
OS_TYPE=$(get_os_type)
if [ $OS_TYPE != 'linux' ] && [ $OS_TYPE != 'darwin' ]; then
    echo "Not Supported OS_TYPE (${OS_TYPE})"
    exit 1
fi
ARCH_BITS=$(get_arch_bits)
if [ ${ARCH_BITS} == '64' ]; then
    ARCH=amd64
elif [ ${ARCH_BITS} == '32' ]; then
    ARCH=386
elif [ ${ARCH_BITS} == 'arm64' ]; then
    ARCH=arm64
else
    echo "Not Supported ARCH"
    exit 1
fi


################################################################################
# Set parameters
################################################################################
GOLANG_VERSION=1.16
GOLANG_ARCHIVE_FILE=go${GOLANG_VERSION}.${OS_TYPE}-${ARCH}.tar.gz
GOLANG_ARCHIVE_URL=https://dl.google.com/go/${GOLANG_ARCHIVE_FILE}
GOROOT=${LOCAL_OPT}/go
GOPATH=${HOME}/golang


################################################################################
# Install golang
################################################################################
echo ">> Download Golang: ${GOLANG_ARCHIVE_URL}"
curl -fsSL -o go.tgz ${GOLANG_ARCHIVE_URL}
echo ">> Install Golang to ${LOCAL_OPT}"
tar -C ${LOCAL_OPT} -xzf go.tgz
rm go.tgz
