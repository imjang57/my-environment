#!/bin/bash

function get_arch_bits() {
    # Get Bits of CPU Architecture
    case $(uname -m) in
    x86_64)
        BITS=64
        ;;
    i*86)
        BITS=32
        ;;
    arm64)
        BITS=arm64
        ;;
    *)
        BITS=""
        return 1
        ;;
    esac

    echo ${BITS}
}


function get_os_type() {
    # Get Operation System type
    UNAME=$(uname -s | tr '[:upper:]' '[:lower:]')
    case ${UNAME} in
    linux)
        OS_TYPE=linux
        ;;
    darwin)
        OS_TYPE=darwin
        ;;
    *)
        OS_TYPE=""
        return 1
        ;;
    esac

    echo ${OS_TYPE}
}


function get_distribution_type() {
    # The latest standard way To get OS and VER is to refer "/etc/os-release".
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi

    echo $OS | awk '{print tolower($0)}'
}
