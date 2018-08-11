#!/bin/bash
# Install zlib (http://www.zlib.net)

################################################################################
# Init script
################################################################################
echo ">> Start installing Golang."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Set parameters
################################################################################
ZLIB_VERSION=1.2.11
ZLIB_NAME=zlib
ZLIB_FULLNAME=${ZLIB_NAME}-${ZLIB_VERSION}
ZLIB_DOWNLOAD_URL=http://www.zlib.net/${ZLIB_FULLNAME}.tar.gz
ZLIB_DOWNLOAD_PATH=${LOCAL_TMP}/${ZLIB_FULLNAME}.tar.gz
ZLIB_LIB_PATH=${LOCAL_LIB}/${ZLIB_FULLNAME}
ZLIB_LIB_PATH_SYMLINK=${LOCAL_LIB}/${ZLIB_NAME}


################################################################################
# Download
################################################################################
echo ">> Download zlib"
curl -fsSL -o zlib.tgz ${ZLIB_DOWNLOAD_URL}

echo ">> Unarchive zlib"
tar -C ${LOCAL_TMP} -xzvf "zlib.tgz"


################################################################################
# Install
################################################################################
echo ">> Build zlib"
(cd ${LOCAL_TMP}/${ZLIB_FULLNAME} \
    && ./configure --prefix ${ZLIB_LIB_PATH} \
    && make \
    && make install)

echo ">> Generate symlink"
ln -s ${ZLIB_LIB_PATH} ${ZLIB_LIB_PATH_SYMLINK}

