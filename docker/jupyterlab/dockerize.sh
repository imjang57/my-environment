#!/bin/bash

set -e

CUR_PATH="$(cd "$(dirname ${0})"; pwd)"

DOCKERFILE=${CUR_PATH}/Dockerfile
BASE_IMG="python:3.7-alpine3.17"

APP_IMG_TAG=20221207
REPOSITORY="imjang57/jupyterlab"
APP_IMG="${REPOSITORY}:${APP_IMG_TAG}"
LATEST_APP_IMG="${REPOSITORY}:latest"

echo "--- Docker build arguments ---"
echo "    CUR_PATH  : $CUR_PATH"
echo "    DOCKERFILE: $DOCKERFILE"
echo "    APP_IMG   : $APP_IMG"
echo "    BASE_IMG  : $BASE_IMG"
echo "------------------------------"

# Add --no-cache option if need to ignore cached images.
docker build \
    --tag "${APP_IMG}" \
    --build-arg BASE_IMG="$BASE_IMG" \
    -f "$DOCKERFILE" \
    --force-rm \
    $CUR_PATH

docker build \
    --tag "${LATEST_APP_IMG}" \
    --build-arg BASE_IMG="$BASE_IMG" \
    -f "$DOCKERFILE" \
    --force-rm \
    $CUR_PATH

