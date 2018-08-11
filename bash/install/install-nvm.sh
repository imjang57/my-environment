#!/bin/bash
################################################################################
# Description
#   - https://github.com/nvm-sh/nvm
################################################################################


################################################################################
# Init script
################################################################################
echo ">> Start installing NVM(Node Version Manager)."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Install
################################################################################
function install-nvm() {
    ############################################################################
    # Install nvm ##############################################################
    ############################################################################
    NVM_DIR=${HOME}/.nvm
    # https://github.com/nvm-sh/nvm#manual-install
    export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    ############################################################################
    # Bash Shell Settings
    ############################################################################
    #  Bash settings to use nvm is written in
    # "../bash-env.sh" file.
}

install-nvm

nvm install --lts

# Run below to install node.js
#
#     nvm ls-remote --lts
#     nvm install v16.14.0
#     nvm ls
