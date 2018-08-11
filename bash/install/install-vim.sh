#!/bin/bash

################################################################################
# Init script
################################################################################
echo ">> Start installing Vim."
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
VIM_VERSION=8.2.3582
VIM_ARCHIVE_URL=https://github.com/vim/vim/archive/v${VIM_VERSION}.tar.gz
VIM_PATH=${LOCAL_OPT}/vim

################################################################################
# Install golang
################################################################################
function install_vim() {
    rm -rf ${LOCAL_OPT}/vim
    echo ">> Download Vim: ${VIM_ARCHIVE_URL}"
    curl -fsSL -o vim.tgz ${VIM_ARCHIVE_URL}
    echo ">> Install Vim to ${LOCAL_OPT}"
    tar -C ${LOCAL_TMP} -xzf vim.tgz
    rm vim.tgz
    (cd ${LOCAL_TMP}/vim-${VIM_VERSION} \
        && ./configure --prefix ${LOCAL_OPT}/vim \
                --with-features=huge \
                --enable-multibyte \
                --enable-pythoninterp \
                --enable-fontset \
                --enable-cscope \
        && make \
        && make install
        )

    # Generate symlinks in LOCAL_BIN to run vim
    ln -sf ${LOCAL_OPT}/vim/bin/vim ${LOCAL_BIN}/vim
    ln -sf ${LOCAL_OPT}/vim/bin/vimdiff ${LOCAL_BIN}/vimdiff
}

case ${DIST_TYPE} in
    darwin)
        brew install vim
        ;;
    *)
        install_vim
        ;;
esac
