#!/bin/bash

set -e

CUR_PATH="$(cd "$(dirname ${0})"; pwd)"

DOCKERFILE=${CUR_PATH}/Dockerfile
BASE_IMG=python:3.7-slim-bullseye

IMG_TAG=20221207
REPOSITORY="imjang57/jupyterlab"
IMG_TAG="20230105"
IMG="${REPOSITORY}:${IMG_TAG}"
LATEST_IMG="${REPOSITORY}:latest"

echo "--- Docker build arguments ---"
echo "    CUR_PATH  : $CUR_PATH"
echo "    DOCKERFILE: $DOCKERFILE"
echo "    IMAGE     : $IMG"
echo "    BASE_IMG  : $BASE_IMG"
echo "------------------------------"

function build_image {
    local BASE_IMG=${1}
    local IMG=${2}
    local DOCKERFILE=${3}
    local BUILD_DIR=${4}

    docker build \
        --tag "${IMG}" \
        --build-arg BASE_IMG="$BASE_IMG" \
        --no-cache \
        -f "$DOCKERFILE" \
        --force-rm \
        $BUILD_DIR
}

build_image ${BASE_IMG} ${IMG} ${DOCKERFILE} ${CUR_PATH}
build_image ${BASE_IMG} ${LATEST_IMG} ${DOCKERFILE} ${CUR_PATH}
