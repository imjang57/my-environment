#!/bin/bash
# This script executes subcommands for topics in AWS MSK Kafka.
#set -e
CUR_PATH="$( cd "$( dirname "$0" )" && pwd )"

if [[ -z ${KAFKA_HOME} ]]; then
    echo "Environment Variable (KAFKA_HOME) is not set."
    exit 1
fi

function print_usage {
cat << EOF
echo ">> Usage: ${0} <Subcommand> <MSK Cluster Name> [Topic]
Required Arguments:
- Subcommand       : The subcommand to run.
                   : ex: create, delete, list
- MSK Cluster Namee: AWS MSK Kafka Cluster Name.
Optional Arguments:
- Topic            : Kafka Topiic.
Required packages:
- awscli (AWS Command-Line Tool).
- Apache Kafka.
Environment Variables:
- KAFKA_HOME: A path which Apache Kafka is installed.
EOF
}

if [[ $# -lt 2 ]]; then
    print_usage
    exit 1
fi

_ARGS=(${@})
SUB_COMMAND=${_ARGS[0]}
SUB_COMMAND_ARGS_LEN=$(expr ${#_ARGS[@]} - 1)
SUB_COMMAND_ARGS=(${_ARGS[@]:1:${SUB_COMMAND_ARGS_LEN}})

function create_topic {
    if [[ -z ${1} ]] || [[ -z ${2} ]]; then
        echo "The create subcommand need: <MSK Cluster Name> <Topic>"
        return 1
    fi

    local CLUSTER_NAME=${1}
    local TOPIC=${2}

    ${KAFKA_HOME}/bin/kafka-topics.sh \
        --bootstrap-server $(bash ${CUR_PATH}/msk-brokers-string.sh ${CLUSTER_NAME}) \
        --create \
        --topic ${TOPIC} \
        --replication-factor 2 \
        --partitions 10 \
        --config retention.ms=86400000 # 1 day
}

function delete_topic {
    if [[ -z ${1} ]] || [[ -z ${2} ]]; then
        echo "The delete subcommand need: <MSK Cluster Name> <Topic>"
        return 1
    fi

    local CLUSTER_NAME=${1}
    local TOPIC=${2}

    ${KAFKA_HOME}/bin/kafka-topics.sh \
        --bootstrap-server $(bash ${CUR_PATH}/msk-brokers-string.sh ${CLUSTER_NAME}) \
        --delete \
        --topic ${TOPIC}
}

function list {
    if [[ -z ${1} ]]; then
        echo "The list subcommand need: <MSK Cluster Name>"
        return 1
    fi

    local CLUSTER_NAME=${1}

    ${KAFKA_HOME}/bin/kafka-topics.sh \
        --bootstrap-server $(bash ${CUR_PATH}/msk-brokers-string.sh ${CLUSTER_NAME}) \
        --list
}

case ${SUB_COMMAND} in
    create)
        create_topic ${SUB_COMMAND_ARGS[@]}
        ;;
    delete)
        delete_topic ${SUB_COMMAND_ARGS[@]}
        ;;
    list)
        list ${SUB_COMMAND_ARGS[@]}
        ;;
    *)
        echo ">> Wrong task_name \`${TASK_NAME}\`."
        print_usage
        exit 1
        ;;
esac
