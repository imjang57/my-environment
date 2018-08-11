#!/bin/bash

set -e

################################################################################
# Install build tools and libraries to build Python.
################################################################################
##### CentOS 7
#yum install -y gcc make
#yum install -y zlib zlib-devel openssl openssl-devel libffi-devel ncurses
##### Alpine Linux
######### Install Utilities
apk add --no-cache coreutils # The basic file, shell and text manipulation utilities
apk add --no-cache dpkg dpkg-dev # The Debian Package Manager
apk add --no-cache curl # HTTP Client to download python package archive
apk add --no-cache findutils # GNU utilities for finding files
apk add --no-cache pax-utils # ELF related utils for ELF 32/64 binaries
######### Install Build tools
apk add --no-cache gcc libc-dev musl-dev make linux-headers
######### Install Python dependencies
apk add --no-cache \
    bzip2-dev libbz2 \
    expat expat-dev \
    libffi libffi-dev \
    libnsl libnsl-dev \
    libtirpc libtirpc-dev \
    gdbm gdbm-dev \
    tcl tcl-dev \
    tk tk-dev \
    zlib zlib-dev \
    xz xz-dev \
    ncurses ncurses-dev \
    readline readline-dev \
    openssl openssl-dev \
    sqlite sqlite-dev


################################################################################
# Set parameters.
################################################################################
PYTHON_VERSION=3.7.3
PYTHON_ARCHIVE_NAME=Python-${PYTHON_VERSION}
PYTHON_ARCHIVE_FILE=Python-${PYTHON_VERSION}.tgz
PYTHON_PREFIX=/usr/lib/python-${PYTHON_VERSION}
#USR_LIB_PATH=/usr/lib64
USR_LIB_PATH=/usr/lib


################################################################################
# Download and unarchive python.
################################################################################
curl -fsSL \
    -o ${PYTHON_ARCHIVE_FILE} \
    https://www.python.org/ftp/python/${PYTHON_VERSION}/${PYTHON_ARCHIVE_FILE}
tar xzvf ${PYTHON_ARCHIVE_FILE}


################################################################################
# Build python in Bash subshell.
################################################################################
(cd ${PYTHON_ARCHIVE_NAME} && \
    ./configure --prefix ${PYTHON_PREFIX} --enable-shared && \
    make && \
    make install
)
rm -r ${PYTHON_ARCHIVE_FILE} ${PYTHON_ARCHIVE_NAME}


################################################################################
# Copy Python shared object (.so) file for Python C Extensions.
################################################################################
cp ${PYTHON_PREFIX}/lib/libpython3.7m.so.1.0 ${USR_LIB_PATH}


################################################################################
# Make symlinks
#     * update-alternatives command is included in dpkg.
################################################################################
ln -sf ${PYTHON_PREFIX}/lib/libpython3.7m.so.1.0 ${USR_LIB_PATH}/libpython3.7m.so
# ln -sf ${PYTHON_PREFIX}/bin/python3.7 /usr/bin/python3.7
# ln -sf /usr/bin/python3.7 /usr/bin/python3
# ln -sf ${PYTHON_PREFIX}/bin/pip3.7 /usr/bin/pip3.7
# ln -sf /usr/bin/pip3.7 /usr/bin/pip3
update-alternatives --install /usr/bin/python3 python3 ${PYTHON_PREFIX}/bin/python3.7 370 \
    --slave /usr/bin/python3.7 python3.7 ${PYTHON_PREFIX}/bin/python3.7 \
    --slave /usr/bin/python37 python37 ${PYTHON_PREFIX}/bin/python3.7 \
    --slave /usr/bin/pydoc3 pydoc3 ${PYTHON_PREFIX}/bin/pydoc3.7 \
    --slave /usr/bin/python3-config python3-config ${PYTHON_PREFIX}/bin/python3.7-config \
    --slave /usr/bin/pyvenv3 pyvenv3 ${PYTHON_PREFIX}/bin/pyvenv-3.7
update-alternatives --install /usr/bin/pip3 pip3 ${PYTHON_PREFIX}/bin/pip3.7 370

update-alternatives --auto python3
update-alternatives --auto pip3

# Notes:
# To remove python3 symlinks, run below:
#     update-alternatives --remove python3 ${PYTHON_PREFIX}/bin/python3.7
# To show current python, run below:
#     cat /var/lib/alternatives/python3
#     ls -al /etc/alternatives/python3

