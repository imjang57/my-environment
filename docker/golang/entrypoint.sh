#!/bin/bash

set -e

CUR_PATH="$(cd "$(dirname ${0})"; pwd)"
#echo "CUR_PATH: ${CUR_PATH}"

ARGS=(${@})
ARGS_LEN=${#ARGS[@]}
#echo "ARGS: ${ARGS[@]}, ARGS_LEN: ${ARGS_LEN}"

if [ ${ARGS_LEN} -eq 0 ]; then
    exec /bin/bash -l
else
    exec ${ARGS[@]}
fi
