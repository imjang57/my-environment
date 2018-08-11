#!/bin/bash
# This script prints AWS MSK Kafka brokers string.
set -e
CUR_PATH="$( cd "$( dirname "$0" )" && pwd )"

KAFKA_CLUSTER_NAME=${1:-'my-kafka'}

KAFKA_CLUSTER_ARN=$(aws kafka list-clusters \
    --cluster-name-filter $KAFKA_CLUSTER_NAME \
    --query "ClusterInfoList[0].ClusterArn" \
    --output text)
BootstrapBrokerString=$(aws kafka get-bootstrap-brokers \
    --region ap-northeast-2 \
    --cluster-arn $KAFKA_CLUSTER_ARN \
    --query "BootstrapBrokerString" \
    --output text)
echo $BootstrapBrokerString
