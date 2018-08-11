#!/bin/bash -l

set -e

apk add --no-cache --virtual .build-deps \
		bash \
		gcc \
		musl-dev \
		openssl \
		go \


################################################################################
# Set parameters.
################################################################################
GOLANG_SRC_FILE=go${GOLANG_VERSION}.linux-amd64.tar.gz
export GOROOT_BOOTSTRAP="$(go env GOROOT)"
export GOOS="$(go env GOOS)"
export GOARCH="$(go env GOARCH)"
export GOHOSTOS="$(go env GOHOSTOS)"
export GOHOSTARCH="$(go env GOHOSTARCH)"


################################################################################
# Download golang
################################################################################
curl -L -o go.tgz https://dl.google.com/go/${GOLANG_SRC_FILE}
tar -C ${GOROOT_PREFIX} -xvf go.tgz
rm -rf go.tgz


################################################################################
# Install golang via bootstrapping
################################################################################
(cd ${GOROOT}/src \
    && ./make.bash \
    && rm -rf ${GOROOT}/pkg/bootstrap ${GOROOT}/pkg/obj)
mkdir -p "$GOPATH/src" "$GOPATH/bin"


################################################################################
# Clean-up
################################################################################
apk del .build-deps
