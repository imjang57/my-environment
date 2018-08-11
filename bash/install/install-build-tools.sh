#!/bin/bash
# Install build tools, such as gcc make
# Install base libraries, such as ncurses

################################################################################
# Init script
################################################################################
echo ">> Start installing Build Tools."
CUR_PATH="$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd)"
set -e
source ${CUR_PATH}/../config.bash
source ${CUR_PATH}/helper.sh


################################################################################
# Set parameters
################################################################################
OS_TYPE=$(get_os_type)
case ${OS_TYPE} in
    linux)
        DIST_TYPE=$(get_distribution_type)
        ;;
    darwin)
        DIST_TYPE="darwin"
        ;;
    *)
        echo "Not supported DIST_TYPE"
        exit 1
        ;;
esac


################################################################################
# Install build tools
################################################################################
case ${DIST_TYPE} in
    amazon*|centos*|redhat)
        yum update -y
        yum groupinstall -y "Development Tools"
        yum install -y sudo ncurses ncurses-devel curl
        # Tools for GPG signing, by OpenPGP (RFC 4880)
        yum install -y gnupg2 pinentry
        ;;
    ubuntu|debian)
        apt update -y
        apt -y install build-essential
        apt -y install sudo libncurses5 libncurses-dev curl
        # Tools for GPG signing, by OpenPGP (RFC 4880)
        apt -y install gnupg pinentry-curses
        ;;
    darwin)
        # Homebrew must be installed.
        # Refer http://brew.sh or https://github.com/Homebrew/brew.
        brew install gcc cmake ncurses
        # Tools for GPG signing, by OpenPGP (RFC 4880)
        brew install gnupg pinentry-mac
        # GNU Tools MacOS build
        brew install tree findutils
        ;;
esac

