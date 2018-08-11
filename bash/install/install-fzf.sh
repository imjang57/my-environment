#!/bin/bash
################################################################################
# Description
#   - https://github.com/junegunn/fzf
################################################################################


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
FZF_GIT_URL=https://github.com/junegunn/fzf.git
FZF_LOCAL_PATH=${HOME}/.fzf


################################################################################
# Install
################################################################################
[[ -e ${FZF_LOCAL_PATH} ]] && rm -rf ${FZF_LOCAL_PATH}
git clone --depth 1 ${FZF_GIT_URL} ${FZF_LOCAL_PATH}
${FZF_LOCAL_PATH}/install \
    --bin \
    --no-zsh \
    --no-fish \
    --no-key-bindings \
    --no-completion \
    --no-update-rc
ln -sf ${FZF_LOCAL_PATH}/bin/fzf ${LOCAL_BIN}/fzf
