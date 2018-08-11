#!/bin/bash
#set -e
CUR_PATH="$(cd "$(dirname "$0")" && pwd)"
echo ">> Start execute script ${BASH_SOURCE[0]}."
source ${CUR_PATH}/bash/config.bash

# Generate symbolic links for configuration files
[[ -f ${HOME}/.vimrc ]] || ln -s ${CUR_PATH}/vim/my-vimrc ${HOME}/.vimrc
mkdir -p ~/.vim && [[ -d ${HOME}/.vim/vimrc.d ]] || ln -s ${CUR_PATH}/vim/vimrc.d ${HOME}/.vim/vimrc.d
[[ -f ${HOME}/.gitconfig ]] || cp ${CUR_PATH}/git/.gitconfig.template ${HOME}/.gitconfig
[[ -f ${HOME}/.gitconfig-myprofile ]] || cp ${CUR_PATH}/git/.gitconfig-profile.template ${HOME}/.gitconfig-myprofile
[[ -f ${HOME}/.gitignore ]] || cp ${CUR_PATH}/git/.gitignore ${HOME}/.gitignore
[[ -f ${HOME}/.tmux.conf ]] || ln -s ${CUR_PATH}/tmux/my-tmux.conf ${HOME}/.tmux.conf

# Generate symbolic links for executables
ln -sf ${CUR_PATH}/bin/git-branch.sh ${LOCAL_BIN}/git-branch.sh
ln -sf ${CUR_PATH}/bin/github-pr.sh ${LOCAL_BIN}/github-pr.sh
