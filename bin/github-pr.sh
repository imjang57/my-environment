#!/bin/bash
set -e
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"

function print_usage {
cat << EOF
>> Usage: ${0} <Remote Name> <PR ID>
Required Arguments:
    - Remote Name: Git Remote Name.
    - PR ID      : ID of Github Pull Request.
EOF
}

if [ ${#} -lt 2 ]; then
    print_usage
    exit 1
fi

REMOTE_NAME=${1}
PR_ID=${2}
BRANCH_NAME=${REMOTE_NAME}-PR-${PR_ID}

################################################################################
# Fetch Remote Github Repository's Pull Request.
# https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/checking-out-pull-requests-locally
################################################################################
git fetch ${REMOTE_NAME} pull/${PR_ID}/head:${BRANCH_NAME}
# Switch to PR branch via below command.
# git checkout ${BRANCH_NAME}
