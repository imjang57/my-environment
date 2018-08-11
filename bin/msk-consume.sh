#!/bin/bash
set -e
CUR_PATH="$( cd "$( dirname "$0" )" && pwd )"

function print_usage {
cat << EOF
echo ">> Usage: ${0} <MSK Cluster Name> <Topic>
- MSK Cluster Namee: AWS MSK Kafka Cluster Name.
- Topic            : Kafka Topiic.
EOF
}

if [[ $# -lt 2 ]]; then
    print_usage
    exit 1
fi

kafka-console-consumer.sh \
    --bootstrap-server $(bash ${CUR_PATH}//msk-brokers-string.sh ${1}) \
    --topic ${2}
