#!/bin/bash
set -e

AWS_ACCOUNT=${AWS_ACCOUNT:-''}

if [ -z ${AWS_ACCOUNT} ]; then
    echo "AWS_ACCOUNT is not set."
    exit 1
fi

function print_usage() {
    cat <<EOF
Usage: ${0} <Role> <command> [args...]
EOF
}

_ARGS=(${@})

if [ ${#_ARGS[@]} -lt 2 ];
then
    print_usage
    exit 1
fi

ROLE=${_ARGS[0]}
COMMAND=${_ARGS[@]:1}
echo "Run command (${COMMAND}) assuming role ${ROLE}"

ASSUME_ROLE_CREDENTIAL=$(aws sts assume-role \
    --role-arn "arn:aws:iam::${AWS_ACCOUNT}:role/${ROLE}" \
    --role-session-name AWSCLI-Session \
    --query 'Credentials.{AccessKeyId:AccessKeyId,SecretAccessKey:SecretAccessKey,SessionToken:SessionToken}')

export AWS_ACCESS_KEY_ID=$(echo ${ASSUME_ROLE_CREDENTIAL} | jq -r .AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo ${ASSUME_ROLE_CREDENTIAL} | jq -r .SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo ${ASSUME_ROLE_CREDENTIAL} | jq -r .SessionToken)

#echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"
#echo "AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}"
#echo "AWS_SESSION_TOKEN: ${AWS_SESSION_TOKEN}"

echo "Run Command: ${COMMAND[@]}"
exec ${COMMAND[@]}
