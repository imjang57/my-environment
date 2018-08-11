#!/bin/bash

################################################################################
# Init script
################################################################################
echo ">> Start installing VIM plu:."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Install Vim plugin vim-plug
################################################################################
VIM_PLUG_DOWNLOAD_URL=https://raw.githubusercontent.com/imjang57/vim-plug/master/plug.vim
VIM_PLUG_LOCAL_PATH=${HOME}/.vim/autoload/plug.vim

curl -fLo ${VIM_PLUG_LOCAL_PATH} --create-dirs ${VIM_PLUG_DOWNLOAD_URL}
vim +PlugInstall +qall
