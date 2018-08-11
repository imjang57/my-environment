#!/bin/bash

################################################################################
# Init script
################################################################################
echo ">> Start installing fzf."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Set parameters
################################################################################
FZF_GIT_URL=https://github.com/imjang57/fzf.git
FZF_LOCAL_PATH=${HOME}/.fzf


################################################################################
# Install golang
################################################################################
echo ">> clone fzf git repository: ${FZF_GIT_URL}"
[[ -e ${FZF_LOCAL_PATH} ]] && rm -rf ${FZF_LOCAL_PATH}
git clone --depth 1 ${FZF_GIT_URL} ${FZF_LOCAL_PATH}
echo ">> Install fzf extra stuffs"
${FZF_LOCAL_PATH}/install \
    --bin \
    --no-zsh \
    --no-fish \
    --no-key-bindings \
    --no-completion \
    --no-update-rc
ln -sf ${FZF_LOCAL_PATH}/bin/fzf ${LOCAL_BIN}/fzf
