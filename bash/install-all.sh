#!/bin/bash

echo ">> Start execute script ${BASH_SOURCE[0]}."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
echo ">> CUR_PATH: ${CUR_PATH}"
set -e

bash "${CUR_PATH}/install/install-build-tools.sh"
bash "${CUR_PATH}/install/install-fzf.sh"
bash "${CUR_PATH}/install/install-uv.sh"
bash "${CUR_PATH}/install/install-vim.sh"
bash "${CUR_PATH}/install/install-vim-plug.sh"
bash "${CUR_PATH}/install/install-nvm.sh"

#bash "${CUR_PATH}/install/install-lsd.sh"
#bash "${CUR_PATH}/install/install-nerd-fonts.sh"
