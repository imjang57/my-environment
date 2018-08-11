#!/bin/bash
set -e

function print_usage {
cat << EOF
>> Usage: ${0} <New branch name> <origin branch name>
Required Arguments:
    - <New branch name>: Name of new branch
    - <origin branch name>: Origin branch name to fork
EOF
}

if [ ${#} -lt 2 ]; then
    print_usage
    exit 1
fi

NEW_BRANCH_NAME="${1}"
ORIGIN_BRANCH_NAME="${2}"

echo ">> Branch ${NEW_BRANCH_NAME} from ${ORIGIN_BRANCH_NAME}."
GIT_PROJ_ROOT="$(git rev-parse --show-toplevel)"
echo ">> At Git root ${GIT_PROJ_ROOT}."

git pull
git branch ${NEW_BRANCH_NAME} ${ORIGIN_BRANCH_NAME}
git worktree add ${GIT_PROJ_ROOT}/../${NEW_BRANCH_NAME} ${NEW_BRANCH_NAME}
