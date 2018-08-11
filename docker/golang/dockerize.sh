#!/bin/bash

set -e

CUR_PATH="$(cd "$(dirname ${0})"; pwd)"

DOCKERFILE=${CUR_PATH}/Dockerfile
BASE_IMG_TAG=3.10.3
BASE_IMG="alpine:$BASE_IMG_TAG"

APP_IMG_TAG=1.13.4
APP_IMG="imjang57/golang:${APP_IMG_TAG}"

echo "--- Docker build arguments ---"
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
