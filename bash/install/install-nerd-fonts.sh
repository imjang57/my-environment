#!/bin/bash
################################################################################
# Description
# - https://github.com/ryanoasis/nerd-fonts
################################################################################


################################################################################
# Init script
################################################################################
echo ">> Start installing nerd-font."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Set parameters
################################################################################
NERD_FONTS_GIT_URL=https://github.com/ryanoasis/nerd-fonts
NERD_FONTS_LOCAL_PATH=${HOME}/.nerd-fonts


################################################################################
# Install
################################################################################
[[ -e ${NERD_FONTS_LOCAL_PATH} ]] && rm -rf ${NERD_FONTS_LOCAL_PATH}
git clone --depth 1 ${NERD_FONTS_GIT_URL} ${NERD_FONTS_LOCAL_PATH}
${NERD_FONTS_LOCAL_PATH}/install.sh Hack
