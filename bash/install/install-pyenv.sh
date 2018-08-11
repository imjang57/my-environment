#!/bin/bash

# pyenv: https://github.com/pyenv/pyenv
# pyenv-virtualenv: https://github.com/pyenv/pyenv-virtualenv

################################################################################
# Init script
################################################################################
echo ">> Start installing Pyenv."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Install pyenv
################################################################################
function install-pyenv-linux() {
    ############################################################################
    # Install pyenv ############################################################
    ############################################################################
    PYENV_GIT_URL=https://github.com/pyenv/pyenv.git
    PYENV_LOCAL_PATH=${HOME}/.pyenv
    git clone ${PYENV_GIT_URL} ${PYENV_LOCAL_PATH}

    ############################################################################
    # Install pyenv-virtualenv #################################################
    ############################################################################
    PYENV_VIRTUALENV_GIT_URL=https://github.com/pyenv/pyenv-virtualenv.git
    PYENV_VIRTUALENV_LOCAL_PATH=${PYENV_LOCAL_PATH}/plugins/pyenv-virtualenv
    git clone ${PYENV_VIRTUALENV_GIT_URL} ${PYENV_VIRTUALENV_LOCAL_PATH}

    ############################################################################
    # Bash Shell Settings
    ############################################################################
    #  Bash settings to use pyenv and pyenv-virtualenv are written in
    # "../bash-env.sh" file.
}

function install-pyenv-macos() {
    brew install pyenv pyenv-virtualenv
}

[[ $OSTYPE == *'darwin'* ]] && install-pyenv-macos || install-pyenv-linux

# Run below to install python
#
#     pyenv install 3.7.2

