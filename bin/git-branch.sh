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

WORKTREE_HOME="${HOME}/worktree"
NEW_BRANCH_NAME="${1}"
ORIGIN_BRANCH_NAME="${2}"

GIT_PROJECT_ROOT="$(git rev-parse --show-toplevel)"
PROJECT_NAME="$(basename ${GIT_PROJECT_ROOT})"
WORKTREE_TARGET_PATH="${WORKTREE_HOME}/${PROJECT_NAME}/${NEW_BRANCH_NAME}"

echo ">> Git project root: ${GIT_PROJECT_ROOT}"
echo ">> Project name: ${PROJECT_NAME}"
echo ">> Git worktree home directory: ${WORKTREE_HOME}"
echo ">> Git worktree target directory: ${WORKTREE_TARGET_PATH}"

echo "======================================================================"
echo ">> Make branch ${NEW_BRANCH_NAME} from ${ORIGIN_BRANCH_NAME}"
git branch ${NEW_BRANCH_NAME} ${ORIGIN_BRANCH_NAME}
echo ">> Make worktree for ${NEW_BRANCH_NAME}"
git worktree add ${WORKTREE_TARGET_PATH} ${NEW_BRANCH_NAME}
