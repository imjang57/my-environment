#!/bin/bash
set -e

function print_usage {
cat << EOF
>> Usage: ${0} <New branch name>
Required Arguments:
    - <New branch name>: Branch name to fork
EOF
}

if [ ${#} -lt 1 ]; then
    print_usage
    exit 1
fi

NEW_BRANCH_NAME="${1}"
echo ">> Branch ${NEW_BRANCH_NAME}."
GIT_PROJ_ROOT="$(git rev-parse --show-toplevel)"
echo ">> At Git root ${GIT_PROJ_ROOT}."

git pull
git br ${NEW_BRANCH_NAME} main
git wt add ${GIT_PROJ_ROOT}/../${NEW_BRANCH_NAME} ${NEW_BRANCH_NAME}
